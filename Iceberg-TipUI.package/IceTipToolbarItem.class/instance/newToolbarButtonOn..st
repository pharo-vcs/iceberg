factory
newToolbarButtonOn: aToolbar
	| button |
	
	button := (IceTipToolbarItemButtonMorph
		on: self 
			getState: nil 
			action:  #execute)
		helpText: self help;
		font: aToolbar toolbarItemFont;
		beIconTop;
		hResizing: #rigid;
		vResizing: #spaceFill;
		borderWidth: 0;
		borderColor: Color transparent;		
		cellPositioning: #center;
		width: aToolbar toolbarItemSize;
		yourself.
		
	aToolbar displayMode 
		configureButton: button 
		item: self.

	^ button