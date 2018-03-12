initialization
initializeWidgets
	panel := PanelMorph new 
		changeTableLayout;
		listDirection: #leftToRight;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		cellInset: 5;
		asSpecAdapter