private factory
newChecksTable
	^ FTTableMorph new 
		addColumn: ((FTColumn id: #target_url) width: 18 * World displayScaleFactor);
		addColumn: ((FTColumn id: #state) width: 65 * World displayScaleFactor);
		addColumn: ((FTColumn id: #context) width: 100 * World displayScaleFactor);
		addColumn: (FTColumn id: #description);
		cellInset: 5 * World displayScaleFactor;
		beResizable;
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		asSpecAdapter
		