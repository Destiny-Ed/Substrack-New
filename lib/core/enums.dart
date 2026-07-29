enum SubscriptionStatus { active, cancelled, expired, paused }

enum BillingCycle { weekly, monthly, quarterly, yearly, custom, daily, semiAnnually }

enum SubscriptionCategory {
  streaming,
  ai,
  music,
  gaming,
  productivity,
  cloud,
  finance,
  education,
  shopping,
  fitness,
  utilities,
  business,
  health,
  other,
  news,
  entertainment,
}

enum ReminderOffset { sameDay, oneDay, threeDays, sevenDays, fourteenDays, thirtyDays }

enum AddSubscriptionAction { addAnother, continueToPaywall }
