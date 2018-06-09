accessing
cellColumn: column row: rowIndex
	"Answer a morph with the cell view. I will probably return a FTCellMorph."
	| item cell |

	item := self elementAt: rowIndex.
	cell := FTCellMorph new
		cellInset: 5;
		yourself.		
	(column readIcon: item) 
		ifNotNil: [ :icon | cell addMorphBack: icon asMorph ]. 
	cell addMorphBack: (column read: item) asMorph.

	^ cell