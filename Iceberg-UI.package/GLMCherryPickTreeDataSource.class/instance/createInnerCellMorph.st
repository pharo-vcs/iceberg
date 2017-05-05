private factory
createInnerCellMorph
	^ Morph new 
		layoutPolicy: TableLayout new;
		color: Color transparent;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		listDirection: #leftToRight;
		cellPositioning: #leftCenter;
		cellInset: 5;
		listCentering: #leftCenter;
		wrapCentering: #leftCenter;
		yourself