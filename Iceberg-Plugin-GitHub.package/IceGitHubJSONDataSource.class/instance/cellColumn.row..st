accessing
cellColumn: column row: rowIndex 
	^ FTCellMorph new  
		addMorphBack: ((self elementAt: rowIndex) at: column id) asStringMorph;
		yourself
	