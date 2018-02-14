accessing
cellColumn: column row: rowIndex
	"Answer a morph with the cell view. I will probably return a FTCellMorph."
	| item |
	item := self elementAt: rowIndex.
	^ FTCellMorph new
		cellInset: 5;
		addMorph: (column read: item) asMorph;
		yourself