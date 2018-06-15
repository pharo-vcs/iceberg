accessing
newCellFor: item
	| cell |
	
	cell := FTIndentedCellMorph new.
	cell indentBy: item depth * 16.
	cell addMorphBack: (self buttonFor: item).
	(self iconFor: item data) 
		ifNotNil: [ :icon | cell addMorphBack: icon asMorph ].
	cell addMorphBack: (self toString: item data) asMorph.
	^ cell