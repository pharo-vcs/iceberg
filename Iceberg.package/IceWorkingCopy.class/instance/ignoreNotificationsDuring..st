private-packages
ignoreNotificationsDuring: aBlock
	"While the working copy is loading code, it should ignore modifications to avoid circular refreshes"

	| oldValue |
	oldValue := shouldIgnoreNotifications.
	shouldIgnoreNotifications := true.
	aBlock ensure: [ shouldIgnoreNotifications := oldValue ]