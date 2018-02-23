initialization
newPanel
	^ PanelMorph new 
		changeTableLayout;
		listDirection: #rightToLeft;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		asSpecAdapter