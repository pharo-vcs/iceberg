private factory
newChecksTable
	^ FTTableMorph new 
		addColumn: ((FTColumn id: #target_url) width: 18);
		addColumn: ((FTColumn id: #state) width: 65);
		addColumn: ((FTColumn id: #context) width: 100);
		addColumn: (FTColumn id: #description);
		cellInset: 5;
		beResizable;
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		asSpecAdapter
		