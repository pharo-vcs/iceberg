configuring
configureButton: aButton item: aToolbarItem
	"ask for icon and label"
	aButton 
		on: aToolbarItem 
		getState: nil
		action: #execute
		label: #label 
		icon: #icon 
		menu: nil.
		
	aButton badgeSelector: #badge
