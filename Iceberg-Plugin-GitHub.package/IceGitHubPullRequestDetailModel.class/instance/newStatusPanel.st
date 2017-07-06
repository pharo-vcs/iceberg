private factory
newStatusPanel
	^ PanelMorph new 
		color: Color transparent;
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		cellInset: 5;
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		asSpecAdapter