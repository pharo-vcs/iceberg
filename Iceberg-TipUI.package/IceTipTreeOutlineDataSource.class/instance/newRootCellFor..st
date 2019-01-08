instance creation
newRootCellFor: item
	| cell |
	cell := IceTipOutlineHeaderCellMorph dataSource: self item: item.
	(self iconFor: item data) ifNotNil: [ :icon | cell addMorphBack: icon asMorph ].
	cell addMorphBack: (self toString: item data) asMorph asReadOnlyMorph.
	cell addMorphBack: (AlignmentMorph newSpacer: Color transparent).
	cell addMorphBack: item children size asMorph asReadOnlyMorph.
	"Since we might have a scroll bar we do not want to have the number of children displayed at the extreme right."
	cell addMorphBack: (Morph newBounds: (0 @ 0 corner: 20 @ 0) color: Color transparent) asReadOnlyMorph.
	^ cell