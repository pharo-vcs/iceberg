*Iceberg-TipUI
newIceTreeTable
	"For the moment, this is the same as a table, but it will receive a tree datasource.
	 But this needs to be a spec component"
	self flag: #todo. "This should be a spec component (but we don't have it for the moment)"
	^ FTTableMorph new
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		asSpecAdapter