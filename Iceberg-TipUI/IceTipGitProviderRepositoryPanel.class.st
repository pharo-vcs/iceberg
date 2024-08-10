"
I'm a panel to show and/or manipulate a project definition in a git remote repository.

I'm an abstract class, and my concrete subclasses define the particularities
for each provider.

"
Class {
	#name : 'IceTipGitProviderRepositoryPanel',
	#superclass : 'IceTipGitRepositoryPanel',
	#instVars : [
		'userNameLabel',
		'userNameInputText',
		'projectNameLabel',
		'projectNameInputText',
		'protocolDropList',
		'protocolLabel'
	],
	#category : 'Iceberg-TipUI-View-Repository',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Repository'
}

{ #category : 'testing' }
IceTipGitProviderRepositoryPanel class >> isAbstract [

	^ super isAbstract or: [ self = IceTipGitProviderRepositoryPanel ]
]

{ #category : 'actions' }
IceTipGitProviderRepositoryPanel >> configureBuilder: aBuilder [

	self subclassResponsibility
]

{ #category : 'layout' }
IceTipGitProviderRepositoryPanel >> defaultLayout [

	^ SpGridLayout new 
		beColumnNotHomogeneous;
		column: 2 expand: true;
		build: [ :builder | builder
			add: userNameLabel; add: userNameInputText; nextRow;
			add: projectNameLabel; add: projectNameInputText; nextRow;
			add: projectLocationLabel; add: projectLocation; nextRow;  
			add: protocolLabel; add: protocolDropList; nextRow ];
		yourself
]

{ #category : 'initialization' }
IceTipGitProviderRepositoryPanel >> initializePresenters [

	super initializePresenters.
	userNameLabel := self newLabel
		label: 'Owner name';
		yourself.
	userNameInputText := self newTextInput
		autoAccept: true;
		placeholder: 'e.g., JohnDoe';
		yourself.
	projectNameLabel := self newLabel
		label: 'Project name';
		yourself.
	projectNameInputText := self newTextInput
		autoAccept: true;
		placeholder: 'e.g., MyProject';
		yourself.
	protocolLabel := self newLabel
		label: 'Protocol';
		yourself.
	protocolDropList := self newDropList.

	userNameInputText
		whenTextChangedDo: [ :text | projectLocation appendPath: self projectAsPathToAppend ].
	projectNameInputText
		whenTextChangedDo: [ :text | projectLocation appendPath: self projectAsPathToAppend ].
	protocolDropList
		items: IceUrlProtocol allSubclasses;
		display: [ :each | each description ];
		selectItem: IceUrlProtocol defaultProtocol.

]

{ #category : 'private' }
IceTipGitProviderRepositoryPanel >> projectAsPathToAppend [

	^ (self userName isEmpty and: [ self projectName isEmpty ])
		ifTrue: [ '' ]
		ifFalse: [ (self userName ifEmpty: [ '?' ]), '/', self projectName ]

]

{ #category : 'accessing' }
IceTipGitProviderRepositoryPanel >> projectName [

	^ self projectNameInputText text asString trimmed
]

{ #category : 'accessing - ui' }
IceTipGitProviderRepositoryPanel >> projectNameInputText [

	^ projectNameInputText
]

{ #category : 'accessing - ui' }
IceTipGitProviderRepositoryPanel >> projectNameLabel [

	^ projectNameLabel
]

{ #category : 'accessing' }
IceTipGitProviderRepositoryPanel >> protocolDropList [

	^ protocolDropList
]

{ #category : 'accessing' }
IceTipGitProviderRepositoryPanel >> protocolLabel [

	^ protocolLabel
]

{ #category : 'accessing' }
IceTipGitProviderRepositoryPanel >> providerName [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
IceTipGitProviderRepositoryPanel >> remoteUrl [
	
	| builder |
	builder := IceUrlBuilder new
		protocol: self selectedProtocol new;
		username: self userName project: self projectName.
	self configureBuilder: builder.
	^ builder buildUrl
]

{ #category : 'accessing' }
IceTipGitProviderRepositoryPanel >> selectedProtocol [

	^ self protocolDropList selectedItem
]

{ #category : 'accessing' }
IceTipGitProviderRepositoryPanel >> userName [

	^ self userNameInputText text asString trimmed
]

{ #category : 'accessing - ui' }
IceTipGitProviderRepositoryPanel >> userNameInputText [

	^ userNameInputText
]

{ #category : 'accessing - ui' }
IceTipGitProviderRepositoryPanel >> userNameLabel [

	^ userNameLabel
]

{ #category : 'accessing' }
IceTipGitProviderRepositoryPanel >> validate [

	self
		assert: self userName isNotEmpty
		description: 'You must enter a GitHub owner (e.g. username).'.
	self
		assert: self projectName isNotEmpty
		description: 'You must enter a GitHub project name.'.
	super validate
]
