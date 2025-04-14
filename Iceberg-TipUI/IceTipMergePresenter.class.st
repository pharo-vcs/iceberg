"
I am a browser to resolve merge conflicts in Iceberg.

For now I only allow to select incoming or current versions of the conflicting elements. 
In the future it would be nice to add the support to be able to produce a 3rd version of the elements mixing both with a code presenter, but this is not yet supported.
"
Class {
	#name : 'IceTipMergePresenter',
	#superclass : 'StPresenter',
	#instVars : [
		'merger',
		'changesTree',
		'diff',
		'code',
		'conflictNumberLabel',
		'toolbar',
		'conflictsButton'
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

{ #category : 'accessing' }
IceTipMergePresenter >> conflictCountString [
	"Answer a string describing the number of conflicts."

	| count |
	count := self merger unresolvedConflictCount.
	^ count = 1
		  ifTrue: [ '1 conflict' translated ]
		  ifFalse: [ '{1} conflicts' translated format: { count } ]
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
			contextClass: item contextClass ].

	changesTree transmitTo: code transform: [ :item |
		'<<<<<<<
' , item value rightContents , '
=======
' , item value leftContents , '
>>>>>>>' ].

	code whenSubmitDo: [ :text |
		self flag: #todo. "Implement feature."
		self inform: 'Feature not supported yet' ]
]

{ #category : 'layout' }
IceTipMergePresenter >> defaultLayout [

	^ SpPanedLayout newTopToBottom
		  positionOfSlider: 60 percent;
		  add: (SpBoxLayout newTopToBottom
				   add: (SpPanedLayout newLeftToRight
						    add: changesTree;
						    add: diff;
						    positionOfSlider: 30 percent;
						    yourself);
				   add: toolbar expand: false;
				   yourself);
		  add: code;
		  yourself
]

{ #category : 'initialization' }
IceTipMergePresenter >> initializePresenters [

	super initializePresenters.

	changesTree := self newTree.
	diff := self newDiff.
	code := self newCode.
	toolbar := self newToolbar.
	conflictsButton := self newToolbarButton.

	toolbar addItemRight: conflictsButton.

	conflictsButton
		label: self conflictCountString;
		icon: (self iconNamed: #changeUpdate);
		help: 'Select next conflict to resolve';
		action: [ self inform: 'Todo' ].

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
IceTipMergePresenter >> merger [
	^ merger
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
