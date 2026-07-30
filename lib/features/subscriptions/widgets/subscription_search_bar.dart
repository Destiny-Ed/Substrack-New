import 'package:flutter/material.dart';

class SubscriptionSearchBar extends StatefulWidget {
  const SubscriptionSearchBar({super.key, required this.onChanged, this.hintText = 'Search subscriptions'});

  final ValueChanged<String> onChanged;
  final String hintText;

  @override
  State<SubscriptionSearchBar> createState() => _SubscriptionSearchBarState();
}

class _SubscriptionSearchBarState extends State<SubscriptionSearchBar> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
    _focusNode = FocusNode();

    _focusNode.addListener(() {
      if (mounted) {
        setState(() {
          _hasFocus = _focusNode.hasFocus;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _clear() {
    _controller.clear();
    widget.onChanged('');
    _focusNode.unfocus();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _hasFocus ? theme.colorScheme.primary : Colors.transparent, width: 1.5),
      ),
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        textInputAction: TextInputAction.search,
        onChanged: (value) {
          widget.onChanged(value);
          setState(() {});
        },
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: InputBorder.none,
          prefixIcon: const Icon(Icons.search_rounded),
          suffixIcon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: _controller.text.isEmpty
                ? const SizedBox.shrink()
                : IconButton(
                    key: const ValueKey('clear'),
                    icon: const Icon(Icons.close_rounded),
                    tooltip: 'Clear search',
                    onPressed: _clear,
                  ),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
      ),
    );
  }
}
