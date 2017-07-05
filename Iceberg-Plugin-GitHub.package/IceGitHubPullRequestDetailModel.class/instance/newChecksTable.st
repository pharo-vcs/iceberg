initialization
newChecksTable
	^ FTTableMorph new 
		addColumn: (FTColumn id: 'state');
		addColumn: (FTColumn id: 'context');
		addColumn: (FTColumn id: 'description');
		addColumn: (FTColumn id: 'target_url');
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		asSpecAdapter
		