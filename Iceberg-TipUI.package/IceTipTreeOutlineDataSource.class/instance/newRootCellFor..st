private factory
newRootCellFor: item
	| cell |
	
	cell := FTIndentedCellMorph new.
	(self iconFor: item data) 
		ifNotNil: [ :icon | cell addMorphBack: icon asMorph ].
	cell addMorphBack: (self toString: item data) asMorph asReadOnlyMorph.
	
	^ cell