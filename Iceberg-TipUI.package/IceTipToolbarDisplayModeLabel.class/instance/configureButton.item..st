configuring
configureButton: aButton item: aToolbarItem
	"ask for label (no icon)"
	aButton 
		on: aToolbarItem 
		getState: nil
		action: #execute
		label: #label 
		icon: nil		
		menu: nil
