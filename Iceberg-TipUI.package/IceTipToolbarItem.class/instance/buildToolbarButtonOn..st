building
buildToolbarButtonOn: aToolbar
	| button |
	
	button := (PluggableButtonMorph
		on: self
			getState: nil 
			action:  #execute 
			label: #label 
			icon: #icon
			menu: nil)
		helpText: self help;
		font: aToolbar toolbarItemFont;
		beIconTop;
		hResizing: #rigid;
		vResizing: #spaceFill;
		borderWidth: 0;
		cellPositioning: #topCenter;
		width: aToolbar toolbarItemSize;
		"backgroundColor: aToolbar color;"
		yourself.
		
	"aToolbar displayMode configureButton: button item: self."
	
	^ button