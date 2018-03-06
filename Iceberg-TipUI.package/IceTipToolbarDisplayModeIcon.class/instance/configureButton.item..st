configuring
configureButton: aButton item: aToolbarItem
	"ask for icon (no label)"
	aButton 
		on: aToolbarItem 
		getState: nil
		action: #execute
		label: nil
		icon: #icon 
		menu: nil.
		
	aButton badgeSelector: #badge.