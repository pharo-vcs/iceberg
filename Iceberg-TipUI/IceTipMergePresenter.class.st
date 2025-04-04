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

{ #category : 'layout' }
IceTipMergePresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: (SpBoxLayout newLeftToRight
				   borderWidth: 10;
				   add: fromLabel;
				   add: (SpBoxLayout newLeftToRight
						    hAlignEnd;
						    add: toLabel;
						    yourself);
				   yourself)
		  expand: false;
		  add: (SpPanedLayout newLeftToRight
				   add: changesTree;
				   add: diff;
				   positionOfSlider: 30 percent;
				   yourself);
		  yourself
]

{ #category : 'initialization' }
IceTipMergePresenter >> initializePresenters [

	super initializePresenters.

	fromLabel := self newLabel.
	toLabel := self newLabel.
	changesTree := self newTree.
	diff := self newDiff.

	fromLabel label: merger sourceDescription.
	toLabel label: merger targetDescription.

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
