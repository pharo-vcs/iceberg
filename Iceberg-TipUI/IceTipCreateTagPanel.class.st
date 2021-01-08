"
I am a spec component that manages the creation of a new tag.
I have a form with a label and an input, and the commitish to tag.

I'm done to be embedded in a dialog, so I implement doAccept to execute my action.
"
Class {
	#name : #IceTipCreateTagPanel,
	#superclass : #IceTipSpPresenter,
	#instVars : [
		'callback',
		'tagNameInputText',
		'commitishToTag',
		'currentCommitishLabel',
		'tagNameLabel',
		'acceptBlock',
		'existingTagsList',
		'majorButton',
		'minorButton',
		'patchButton'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #specs }
IceTipCreateTagPanel class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: #currentCommitishLabel height: self inputTextHeight;
		  add: (SpBoxLayout newHorizontal
				   add: #tagNameLabel width: self labelWidth;
				   add: #tagNameInputText;
				   yourself)
		  height: self inputTextHeight;
		  add: (SpBoxLayout newHorizontal
				   add: #majorButton;
				   add: #minorButton;
				   add: #patchButton;
				   yourself)
		  height: self inputTextHeight;
		  add: #existingTagsList height: self inputTextHeight * 3;
		  yourself
]

{ #category : #accessing }
IceTipCreateTagPanel class >> icon [
	^ self iconNamed: #smallNew
]

{ #category : #accessing }
IceTipCreateTagPanel >> accept [

	self validate.
	self doAccept.
	acceptBlock ifNotNil: [ acceptBlock cull: self ]
]

{ #category : #accessing }
IceTipCreateTagPanel >> commitish: anIceTipCachedModel [
	
	commitishToTag := anIceTipCachedModel
]

{ #category : #accessing }
IceTipCreateTagPanel >> commitishToTag [

	^ commitishToTag
]

{ #category : #'accessing ui' }
IceTipCreateTagPanel >> currentCommitishLabel [

	^ currentCommitishLabel
]

{ #category : #actions }
IceTipCreateTagPanel >> doAccept [

	self validate.
	commitishToTag
		createTag: self tagName
		thenDo: [ :newBranch | callback ifNotNil: [ callback value: newBranch ] ]
]

{ #category : #'accessing ui' }
IceTipCreateTagPanel >> existingTagsList [

	^ existingTagsList
]

{ #category : #initialization }
IceTipCreateTagPanel >> initializeCurrentBranchLabel [

	currentCommitishLabel := self newLabel
		label: 'Current commit: ', commitishToTag commit shortId;
		yourself

]

{ #category : #initialization }
IceTipCreateTagPanel >> initializeExistingTagsList [

	existingTagsList := self newList.
	existingTagsList
		items: commitishToTag tagModels;
		display: #name;
		sortingBlock: #name descending

]

{ #category : #initialization }
IceTipCreateTagPanel >> initializeNextTagPanel [

	| parts prefix nextMajor nextMinor nextPatch toString |
	parts := self latestTagParts.
	prefix := parts first.
	parts := parts allButFirst.
	toString := [ :arr | (arr collect: #asString) joinUsing: '.' ].
	nextMajor := prefix , (toString value: (Array with: parts first + 1 with: 0 with: 0)).
	nextMinor := prefix
		, (toString value: (Array with: parts first with: parts second + 1 with: 0)).
	nextPatch := prefix
		, (toString value: (Array with: parts first with: parts second with: parts third + 1)).
	majorButton := self newButton
		label: 'major (' , nextMajor , ')';
		action: [ tagNameInputText text: nextMajor ].
	minorButton := self newButton
		label: 'minor (' , nextMinor , ')';
		action: [ tagNameInputText text: nextMinor ].
	patchButton := self newButton
		label: 'patch (' , nextPatch , ')';
		action: [ tagNameInputText text: nextPatch ]

]

{ #category : #initialization }
IceTipCreateTagPanel >> initializePresenters [

	super initializePresenters.
	self initializeCurrentBranchLabel.

	tagNameLabel := self newLabel
		                label: 'New tag';
		                yourself.
	tagNameInputText := self newTextInput
		                    autoAccept: true;
		                    placeholder: 'e.g., v[X].[Y].[Z]';
		                    yourself.

	self initializeNextTagPanel.
	self initializeExistingTagsList.

]

{ #category : #testing }
IceTipCreateTagPanel >> isNewBranch [
	^ true
]

{ #category : #accessing }
IceTipCreateTagPanel >> latestTagParts [

	^ self latestTagPartsIn: (commitishToTag tagModels collect: #name)
]

{ #category : #accessing }
IceTipCreateTagPanel >> latestTagPartsIn: tagNames [

	| prefix parts |
	"Find the highest numeric version with optional 'v' prefix. Set any missing parts to 0. For proper comparison (build data, prerelease, etc.), a Semver library is needed."
	parts := #('v' 0 0 0).
	prefix := 'v'.
	(tagNames select: [ :each | 'v?[0-9]' asRegex matchesPrefix: each ])
		ifNotEmpty: [ :tags | 
			| latestTag |
			latestTag := tags sorted last.
			parts := ((latestTag beginsWith: prefix)
				ifTrue: [ #('v') ]
				ifFalse: [ #('') ])
				,
					((((latestTag withoutPrefix: prefix) copyUpTo: $-) splitOn: '.')
						collect: [ :each | NumberParser parse: each onError: [ 0 ] ]).
			parts := parts , (#(0 0 0) first: 4 - parts size) ].
	^ parts
]

{ #category : #'accessing ui' }
IceTipCreateTagPanel >> majorButton [
	^ majorButton
]

{ #category : #'accessing ui' }
IceTipCreateTagPanel >> minorButton [
	^ minorButton
]

{ #category : #accessing }
IceTipCreateTagPanel >> openDialogWithSpec [

	^ super openDialogWithSpec
		okAction: [ self accept ];
		yourself
]

{ #category : #'accessing ui' }
IceTipCreateTagPanel >> patchButton [

	^ patchButton
]

{ #category : #accessing }
IceTipCreateTagPanel >> setModelBeforeInitialization: aCommitish [

	self commitish: aCommitish
]

{ #category : #'accessing ui' }
IceTipCreateTagPanel >> tagName [

	^ self tagNameInputText text asString trimBoth
]

{ #category : #'accessing ui' }
IceTipCreateTagPanel >> tagNameInputText [

	^ tagNameInputText
]

{ #category : #'accessing ui' }
IceTipCreateTagPanel >> tagNameLabel [

	^ tagNameLabel
]

{ #category : #api }
IceTipCreateTagPanel >> titleForWindow [

	^ 'New tag of ' , commitishToTag name
]

{ #category : #accessing }
IceTipCreateTagPanel >> validate [

	self 
		assert: self tagName isNotEmpty
		description: 'Please enter your new branch name.'.
	self 
		assert: (self tagName noneSatisfy: #isSeparator)
		description: 'You can''t have spaces in your branch name.'
]

{ #category : #callbacks }
IceTipCreateTagPanel >> withResultDo: aBlockClosure [ 
	
	callback := aBlockClosure
]
