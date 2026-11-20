import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subtrack/core/theme/app_theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkMode = false;
  String _currency = 'USD';
  String _appVersion = '1.0.0';

  @override
  void initState() {
    super.initState();
    _loadPreferences();
    _loadPackageInfo();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _notificationsEnabled = prefs.getBool('notifications_enabled') ?? true;
      _darkMode = prefs.getBool('dark_mode') ?? false;
      _currency = prefs.getString('default_currency') ?? 'USD';
    });
  }

  Future<void> _loadPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _appVersion = '${info.version} (${info.buildNumber})';
    });
  }

  Future<void> _setNotifications(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications_enabled', value);
    setState(() => _notificationsEnabled = value);
    HapticFeedback.lightImpact();
  }

  Future<void> _setDarkMode(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('dark_mode', value);
    setState(() => _darkMode = value);
    HapticFeedback.lightImpact();
  }

  Future<void> _setCurrency(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('default_currency', value);
    setState(() => _currency = value);
    HapticFeedback.selectionClick();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SpiverAppBar(
            pinned: true,
            floating: false,
            expandedHeight: 120,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
              onPressed: () => context.pop(),
            ),
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 56, bottom: 16),
              title: Text(
                'Settings',
                style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: isDark
                        ? [const Color(0xFF1E293B), AppColors.surfaceDark]
                        : [const Color(0xFFEEF2FF), AppColors.surfaceLight],
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 40),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _PremiumCard(),
                const SizedBox(height: 28),
                _SectionHeader(title: 'Preferences'),
                const SizedBox(height: 12),
                _SettingsCard(
                  children: [
                    _SettingsTile(
                      icon: Icons.notifications_active_rounded,
                      iconColor: AppColors.info,
                      title: 'Renewal Reminders',
                      subtitle: 'Get notified before subscriptions renew',
                      trailing: Switch.adaptive(
                        value: _notificationsEnabled,
                        activeColor: AppColors.primary,
                        onChanged: _setNotifications,
                      ),
                    ),
                    const _Divider(),
                    _SettingsTile(
                      icon: Icons.dark_mode_rounded,
                      iconColor: const Color(0xFF8B5CF6),
                      title: 'Dark Mode',
                      subtitle: 'Easier on the eyes at night',
                      trailing: Switch.adaptive(
                        value: _darkMode,
                        activeColor: AppColors.primary,
                        onChanged: _setDarkMode,
                      ),
                    ),
                    const _Divider(),
                    _SettingsTile(
                      icon: Icons.attach_money_rounded,
                      iconColor: AppColors.accent,
                      title: 'Default Currency',
                      subtitle: _currency,
                      trailing: const Icon(Icons.chevron_right_rounded, size: 22),
                      onTap: () => _showCurrencyPicker(context),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                _SectionHeader(title: 'Data & Privacy'),
                const SizedBox(height: 12),
                _SettingsCard(
                  children: [
                    _SettingsTile(
                      icon: Icons.file_download_outlined,
                      iconColor: AppColors.primary,
                      title: 'Export Data',
                      subtitle: 'Download your subscriptions as CSV',
                      trailing: const Icon(Icons.chevron_right_rounded, size: 22),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Export coming soon')),
                        );
                      },
                    ),
                    const _Divider(),
                    _SettingsTile(
                      icon: Icons.delete_outline_rounded,
                      iconColor: AppColors.danger,
                      title: 'Clear All Data',
                      subtitle: 'Permanently delete all subscriptions',
                      trailing: const Icon(Icons.chevron_right_rounded, size: 22),
                      onTap: () => _showClearDataDialog(context),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                _SectionHeader(title: 'Support'),
                const SizedBox(height: 12),
                _SettingsCard(
                  children: [
                    _SettingsTile(
                      icon: Icons.help_outline_rounded,
                      iconColor: AppColors.info,
                      title: 'Help & FAQ',
                      trailing: const Icon(Icons.chevron_right_rounded, size: 22
                      onTap: () {},
                    ),
                    const _Divider(),
                    _SettingsTile(
                      icon: Icons.mail_outline_rounded,
                      iconColor: AppColors.primary,
                      title: 'Contact Support',
                      trailing: const Icon(Icons.chevron_right_rounded, size: 22),
                      onTap: () {},
                    ),
                    const _Divider(),
                    _SettingsTile(
                      icon: Icons.star_outline_rounded,
                      iconColor: AppColors.warning,
                      title: 'Rate Subtrack',
                      trailing: const Icon(Icons.chevron_right_rounded, size: 22),
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                _SectionHeader(title: 'About'),
                const SizedBox(height: 12),
                _SettingsCard(
                  children: [
                    _SettingsTile(
                      icon: Icons.info_outline_rounded,
                      iconColor: const Color(0xFF64748B),
                      title: 'Version',
                      subtitle: _appVersion,
                    ),
                    const _Divider(),
                    _SettingsTile(
                      icon: Icons.description_outlined,
                      iconColor: const Color(0xFF64748B),
                      title: 'Terms of Service',
                      trailing: const Icon(Icons.chevron_right_rounded, size: 22),
                      onTap: () {},
                    ),
                    const _Divider(),
                    _SettingsTile(
                      icon: Icons.privacy_tip_outlined,
                      iconColor: const Color(0xFF64748B),
                      title: 'Privacy Policy',
                      trailing: const Icon(Icons.chevron_right_rounded, size: 22),
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Made with ❤️ for smarter spending',
                        style: theme.textTheme.bodySmall,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Subtrack',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  void _showCurrencyPicker(BuildContext context) {
    final currencies = ['USD', 'NGN', 'EUR', 'GBP', 'CAD', 'AUD', 'INR', 'JPY'];
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).cardTheme.color,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              Text('Select Currency', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 12),
              ...currencies.map((c) {
                final selected = c == _currency;
                return ListTile(
                  title: Text(c, style: TextStyle(fontWeight: selected ? FontWeight.w700 : FontWeight.w500)),
                  trailing: selected
                      ? const Icon(Icons.check_circle_rounded, color: AppColors.primary)
                      : null,
                  onTap: () {
                    _setCurrency(c);
                    Navigator.pop(ctx);
                  },
                );
              }),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  void _showClearDataDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Clear all data?'),
        content: const Text(
          'This will permanently delete every subscription you have tracked. This action cannot be undone.',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('All data cleared')),
              );
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.danger),
            child: const Text('Delete everything'),
          ),
        ],
      ),
    );
  }
}

class _PremiumCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF5B5FEF), Color(0xFF8B5CF6)],
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.35),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.workspace_premium_rounded, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Go Premium',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Unlimited subscriptions, insights & more',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 13,
                    color: Colors.white.withValues(alpha: 0.85),
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 16),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        title.toUpperCase(),
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w700,
              letterSpacing: 1.1,
            ),
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white.withValues(alpha: 0.06)
              : Colors.grey.shade200,
        ),
        boxShadow: [
          if (Theme.of(context).brightness == Brightness.light)
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: Column(children: children),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.titleMedium),
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      Text(subtitle!, style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ],
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      indent: 70,
      color: Theme.of(context).dividerTheme.color,
    );
  }
}
