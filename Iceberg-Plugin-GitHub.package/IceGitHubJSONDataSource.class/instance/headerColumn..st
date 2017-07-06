accessing
headerColumn: column
	column id ifNil: [ ^ nil ]. 
	^ FTCellMorph new 
		cellInset: 5;
		addMorph: column id capitalized asMorph;
		yourself