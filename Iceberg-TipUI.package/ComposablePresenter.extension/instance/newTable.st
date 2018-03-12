*Iceberg-TipUI
newTable
	self flag: #todo. "This should be a spec component (but we don't have it for the moment)"
	^ FTTableMorph new
		changeProportionalLayout;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		asSpecAdapter