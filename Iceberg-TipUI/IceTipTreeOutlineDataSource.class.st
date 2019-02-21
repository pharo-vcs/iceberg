"
Description
--------------------

I'm a tree datasource to generate an Outline component.

My roots are displayed as section and not as part of the tree.
"
Class {
	#name : #IceTipTreeOutlineDataSource,
	#superclass : #IceTipTreeDataSource,
	#category : 'Iceberg-TipUI-View-DataSource'
}

{ #category : #'instance creation' }
IceTipTreeOutlineDataSource >> cellColumn: column row: rowIndex [
	| item |
	
	item := self elementAt: rowIndex.
	^ item depth = 0
		ifTrue: [ self newRootCellFor: item ]
		ifFalse: [ self newCellFor: item ] 
]

{ #category : #'private factory' }
IceTipTreeOutlineDataSource >> cellIndentFor: item [
	^ ((item depth - 1) * 16) + 3 
]

{ #category : #'instance creation' }
IceTipTreeOutlineDataSource >> newRootCellFor: item [
	| cell |
	cell := IceTipOutlineHeaderCellMorph dataSource: self item: item.
	(self iconFor: item data) ifNotNil: [ :icon | cell addMorphBack: icon asMorph ].
	cell addMorphBack: (self toString: item data) asMorph asReadOnlyMorph.
	cell addMorphBack: (AlignmentMorph newSpacer: Color transparent).
	cell addMorphBack: item children size asMorph asReadOnlyMorph.
	"Since we might have a scroll bar we do not want to have the number of children displayed at the extreme right."
	cell addMorphBack: (Morph newBounds: (0 @ 0 corner: 20 @ 0) color: Color transparent) asReadOnlyMorph.
	^ cell
]
