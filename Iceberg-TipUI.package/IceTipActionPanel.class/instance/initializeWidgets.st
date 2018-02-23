initialization
initializeWidgets
	panel := self newPanel.
	panel widget addMorphBack: (actionMorphPanel := PanelMorph new 
		changeTableLayout;
		listDirection: #rightToLeft;
		hResizing: #shrinkWrap;
		vResizing: #spaceFill;
		yourself)