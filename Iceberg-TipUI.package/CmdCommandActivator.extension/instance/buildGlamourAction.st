*Iceberg-TipUI
buildGlamourAction
	| action |

	self canExecuteCommand ifFalse: [ ^self ].
	
	action := (GLMAction new
		title: self menuItemName;
		icon: self menuItemIcon;
		action: [ self executeCommand ];
		yourself).
	
	self setUpShortcutForGlamourAction: action.
	
	^ action