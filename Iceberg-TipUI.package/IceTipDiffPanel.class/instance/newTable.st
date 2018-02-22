private factory
newTable
	^ FTTableMorph new
		changeProportionalLayout;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		asSpecAdapter