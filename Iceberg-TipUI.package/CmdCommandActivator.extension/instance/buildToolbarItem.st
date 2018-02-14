*Iceberg-TipUI
buildToolbarItem
	| item |

	item := (IceTipToolbarItem new
		label: self menuItemName;
		icon: self menuItemIcon;
		position: self activationStrategy position;
		help: self activationStrategy help;
		action: [ self executeCommand ];
		yourself).
	
	self setUpShortcutForToobarItem: item.
	
	^ item