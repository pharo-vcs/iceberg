initialization
initializeWidgets
	panel := self newIcePanel.
	panel widget addMorphBack: (actionMorphPanel := PanelMorph new 
		changeTableLayout;
		listDirection: #rightToLeft;
		hResizing: #shrinkWrap;
		vResizing: #spaceFill;
		yourself)