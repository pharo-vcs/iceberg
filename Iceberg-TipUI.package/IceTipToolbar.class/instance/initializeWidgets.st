initialization
initializeWidgets
	leftPanel := self newPanel.
	rightPanel := self newPanel
		listDirection: #rightToLeft;
		hResizing: #spaceFill.

	panel := PanelMorph new 
		changeTableLayout;
		listDirection: #leftToRight;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		color: self color;
		asSpecAdapter.
		
	panel widget 
		addMorphBack: leftPanel;
		addMorphBack: rightPanel
	
