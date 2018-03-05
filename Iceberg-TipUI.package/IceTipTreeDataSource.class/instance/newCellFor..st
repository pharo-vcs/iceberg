private factory
newCellFor: item
	| cell |
	
	cell := FTIndentedCellMorph new.
	cell indentBy: (self cellIndentFor: item).
	cell addMorphBack: (self buttonFor: item).
	(self iconFor: item data) 
		ifNotNil: [ :icon | cell addMorphBack: icon asMorph ].
	cell addMorphBack: (self toString: item data) asMorph asReadOnlyMorph.
	
	^ cell 