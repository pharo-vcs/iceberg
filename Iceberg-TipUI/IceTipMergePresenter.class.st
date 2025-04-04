Class {
	#name : 'IceTipMergePresenter',
	#superclass : 'StPresenter',
	#instVars : [
		'merger',
		'fromLabel',
		'toLabel',
		'changesTree',
		'diff'
	],
	#category : 'Iceberg-TipUI-View-Merge',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Merge'
}

{ #category : 'accessing' }
IceTipMergePresenter class >> defaultPreferredExtent [

	^ (900 @ 600) scaledByDisplayScaleFactor
]

{ #category : 'instance creation' }
IceTipMergePresenter class >> forMerger: anIceMerge [

	^ self on: anIceMerge
]

{ #category : 'accessing' }
IceTipMergePresenter >> changes [
	"Answer the changes tree roots."

	^ merger mergeTree children
]

{ #category : 'initialization' }
IceTipMergePresenter >> connectPresenters [

	super connectPresenters.

	changesTree whenSelectionChangedDo: [ :selection |
		| item |
		item := selection selectedItem value.
		diff
			leftText: item rightContents;
			rightText: item leftContents;
			contextClass: item contextClass ]
]

{ #category : 'layout' }
IceTipMergePresenter >> defaultLayout [

	^ SpPanedLayout newLeftToRight
		  add: changesTree;
		  add: diff;
		  positionOfSlider: 30 percent;
		  yourself
]

{ #category : 'initialization' }
IceTipMergePresenter >> initializePresenters [

	super initializePresenters.

	changesTree := self newTree.
	diff := self newDiff.

	diff leftLabel: merger sourceDescription.
	diff rightLabel: merger targetDescription.

	changesTree
		roots: self changes;
		display: [ :item | item value description ];
		children: [ :item | item children ];
		displayIcon: [ :item | item value icon ];
		expandAll
]

{ #category : 'accessing' }
IceTipMergePresenter >> merger: anIceMerger [

	merger := anIceMerger
]

{ #category : 'accessing' }
IceTipMergePresenter >> setModelBeforeInitialization: aMerger [

	super setModelBeforeInitialization: aMerger.
	self merger: aMerger
]

{ #category : 'accessing' }
IceTipMergePresenter >> windowTitle [

	^ 'Merge'
]
