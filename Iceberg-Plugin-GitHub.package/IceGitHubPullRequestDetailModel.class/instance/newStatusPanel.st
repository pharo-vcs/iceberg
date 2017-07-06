private factory
newStatusPanel
	^ PanelMorph new 
		color: Color transparent;
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		asSpecAdapter