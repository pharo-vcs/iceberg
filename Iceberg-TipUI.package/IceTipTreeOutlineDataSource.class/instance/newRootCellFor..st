instance creation
newRootCellFor: item
	| cell |
	
	cell := IceTipOutlineHeaderCellMorph dataSource: self item: item.
	(self iconFor: item data) 
		ifNotNil: [ :icon | cell addMorphBack: icon asMorph ].
	cell addMorphBack: (self toString: item data) asMorph asReadOnlyMorph.
	
	^ cell
