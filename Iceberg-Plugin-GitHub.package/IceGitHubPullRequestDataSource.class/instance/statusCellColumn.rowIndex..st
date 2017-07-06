private
statusCellColumn: column rowIndex: rowIndex
	| status |
	status := (self elementAt: rowIndex) at: column id.
	^ FTCellMorph new  
		cellInset: 5;
		addMorphBack: (self iconForStatus: status) asMorph;
		addMorphBack: status asStringMorph;
		yourself
	