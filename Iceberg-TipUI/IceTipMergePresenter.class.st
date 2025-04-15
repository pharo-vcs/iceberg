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

{ #category : 'actions' }
IceTipMergePresenter >> changesTreeActions [

	^ SpActionGroup new
		  addGroupWith: [ :aGroup |
			  aGroup
				  beDisplayedAsGroup;
				  addActionWith: [ :action |
					  action
						  name: 'Browse';
						  iconName: #browse;
						  description: 'Browse the selected class or method.';
						  shortcutKey: $b actionModifier;
						  action: [ (Smalltalk tools toolNamed: #browser) openOnClass: self selectedClass selector: self selectedMethodSelector ];
						  actionEnabled: [ self selectedClass isNotNil ] ];
				  addActionWith: [ :action |
					  action
						  name: 'Browse senders';
						  iconName: #search;
						  description: 'Browse the senders of the selected method.';
						  shortcutKey: $n actionModifier;
						  action: [ self systemNavigation browseAllSendersOf: self selectedMethodSelector ];
						  actionEnabled: [ self selectedMethod isNotNil ] ];
				  addActionWith: [ :action |
					  action
						  name: 'Browse implementors';
						  iconName: #search;
						  description: 'Browse the implementors of the selected method.';
						  shortcutKey: $m actionModifier;
						  action: [ self systemNavigation browseAllImplementorsOf: self selectedMethodSelector ];
						  actionEnabled: [ self selectedMethod isNotNil ] ];
				  addActionWith: [ :action |
					  action
						  name: 'Versions';
						  iconName: #history;
						  description: 'Show local method versions.';
						  shortcutKey: $v actionModifier;
						  action: [ (Smalltalk tools toolNamed: #versionBrowser) browseVersionsForClass: self selectedClass selector: self selectedMethodSelector ];
						  actionEnabled: [ self selectedMethod isNotNil ] ];
				  yourself ];
		  addGroupWith: [ :aGroup |
			  aGroup
				  beDisplayedAsGroup;
				  addActionWith: [ :action |
					  action
						  name: 'Install incoming version';
						  iconName: #smallUpdate;
						  description: 'Install the version been merged in the image.';
						  action: [ self selectedMethod definition install ];
						  actionEnabled: [ self selectedMethod isNotNil ] ];
				  addActionWith: [ :action |
					  action
						  name: 'Revert change';
						  iconName: #cancel;
						  description: 'Revert the selected change.';
						  action: [ changesTree selectedItem inverseDefinition install ];
						  actionEnabled: [ changesTree selectedItem isNotNil ] ];
				  yourself ];
		  addGroupWith: [ :aGroup |
			  aGroup
				  beDisplayedAsSubMenu;
				  name: 'Extra';
				  addActionWith: [ :action |
					  action
						  name: 'Inspect';
						  iconName: #inspect;
						  action: [ changesTree selectedItem inspect ];
						  actionEnabled: [ changesTree selectedItem isNotNil ] ] ] yourself
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
		action: [ self selectNextConflict ].

	diff leftLabel: merger sourceDescription.
	diff rightLabel: merger targetDescription.

	changesTree
		roots: self changes;
		display: [ :item | item value description ];
		children: [ :item | item children ];
		displayIcon: [ :item | item value icon ];
		actions: self changesTreeActions;
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
IceTipMergePresenter >> nextConflict [

	| currentNode |
	currentNode := changesTree selectedItem ifNil: [ merger mergeTree children first ].
	^ currentNode nextNodeSuchThat: [ :item | item value isConflict and: [ item value isResolved not ] ] ifNone: [ nil ]
]

{ #category : 'actions' }
IceTipMergePresenter >> selectNextConflict [

	^ self nextConflict
		  ifNotNil: [ :change | changesTree selectItem: change ]
		  ifNil: [ self inform: 'No next conflict to resolve.' ]
]

{ #category : 'accessing' }
IceTipMergePresenter >> selectedClass [

	^ changesTree selectedItem value actualClass
]

{ #category : 'accessing' }
IceTipMergePresenter >> selectedMethod [
	"Return the selected method change if the selected element is one. Else return nil."

	| item |
	item := changesTree selectedItem ifNil: [ ^ nil ].
	(item definition isMethodDefinition and: [ item definition isLoadable ]) ifTrue: [ ^ item ].
	^ nil
]

{ #category : 'accessing' }
IceTipMergePresenter >> selectedMethodSelector [

	^ self selectedMethod ifNotNil: [ :node | node definition selector ]
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
