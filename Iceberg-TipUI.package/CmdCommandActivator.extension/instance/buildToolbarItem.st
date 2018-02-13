*Iceberg-TipUI
buildToolbarItem
	| item |

	item := (IceTipToolbarItem new
		label: self menuItemName;
		icon: self menuItemIcon;
		action: [ self executeCommand ];
		yourself).
	
	self setUpShortcutForToobarItem: item.
	
	^ item