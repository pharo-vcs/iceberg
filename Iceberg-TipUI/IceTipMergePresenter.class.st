Class {
	#name : 'IceTipMergePresenter',
	#superclass : 'StPresenter',
	#instVars : [
		'merger',
		'fromLabel',
		'toLabel',
		'changesTree'
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

	self flag: #todo. "Do we need the wrapper without worphic?"
	^ merger mergeTree children collect: [ :each | IceMergeListWrapper with: each model: merger ]
]

{ #category : 'layout' }
IceTipMergePresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: (SpBoxLayout newLeftToRight
				   add: fromLabel;
				   add: (SpBoxLayout newLeftToRight
						    hAlignEnd;
						    add: toLabel;
						    yourself);
				   yourself)
		  expand: false;
		  add: changesTree;
		  yourself
]

{ #category : 'initialization' }
IceTipMergePresenter >> initializePresenters [

	super initializePresenters.

	fromLabel := self newLabel.
	toLabel := self newLabel.
	changesTree := self newTree.

	fromLabel label: merger sourceDescription.
	toLabel label: merger targetDescription.

	changesTree
		items: self changes;
		children: [ :item | item contents ];
		displayIcon: [ :item | item icon ];
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
