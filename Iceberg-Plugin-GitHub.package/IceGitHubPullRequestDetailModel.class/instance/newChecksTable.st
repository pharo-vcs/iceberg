private factory
newChecksTable
	^ FTTableMorph new 
		addColumn: ((FTColumn id: 'state') width: 50);
		addColumn: ((FTColumn id: 'context') width: 100);
		addColumn: (FTColumn id: 'description');
		cellInset: 5;
		beResizable;
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		asSpecAdapter
		