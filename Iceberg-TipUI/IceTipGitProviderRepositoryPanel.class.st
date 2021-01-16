Class {
	#name : #IceTipGitProviderRepositoryPanel,
	#superclass : #IceTipGitRepositoryPanel,
	#instVars : [
		'userNameLabel',
		'userNameInputText',
		'projectNameLabel',
		'projectNameInputText',
		'protocolDropList',
		'protocolLabel'
	],
	#category : #'Iceberg-TipUI-View-RepositoryType'
}

{ #category : #specs }
IceTipGitProviderRepositoryPanel class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: (SpBoxLayout newHorizontal
				   add: #userNameLabel width: self labelWidth;
				   add: #userNameInputText;
				   yourself)
		  height: self inputTextHeight;
		  add: (SpBoxLayout newHorizontal
				   add: #projectNameLabel width: self labelWidth;
				   add: #projectNameInputText;
				   yourself)
		  height: self inputTextHeight;
		  add: #projectLocation height: self inputTextHeight;
		  add: (SpBoxLayout newHorizontal
				   add: #protocolLabel width: self labelWidth;
				   add: #protocolDropList;
				   yourself)
		  height: self inputTextHeight;
		  yourself
]

{ #category : #testing }
IceTipGitProviderRepositoryPanel class >> isAbstract [

	^ super isAbstract or: [ self = IceTipGitProviderRepositoryPanel ]
]

{ #category : #actions }
IceTipGitProviderRepositoryPanel >> configureBuilder: aBuilder [

	self subclassResponsibility
]

{ #category : #initialization }
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

{ #category : #private }
IceTipGitProviderRepositoryPanel >> projectAsPathToAppend [

	^ (self userName isEmpty and: [ self projectName isEmpty ])
		ifTrue: [ '' ]
		ifFalse: [ (self userName ifEmpty: [ '?' ]), '/', self projectName ]

]

{ #category : #accessing }
IceTipGitProviderRepositoryPanel >> projectName [

	^ self projectNameInputText text asString trimmed
]

{ #category : #'accessing ui' }
IceTipGitProviderRepositoryPanel >> projectNameInputText [

	^ projectNameInputText
]

{ #category : #'accessing ui' }
IceTipGitProviderRepositoryPanel >> projectNameLabel [

	^ projectNameLabel
]

{ #category : #accessing }
IceTipGitProviderRepositoryPanel >> protocolDropList [

	^ protocolDropList
]

{ #category : #accessing }
IceTipGitProviderRepositoryPanel >> protocolLabel [

	^ protocolLabel
]

{ #category : #accessing }
IceTipGitProviderRepositoryPanel >> providerName [

	^ self subclassResponsibility
]

{ #category : #accessing }
IceTipGitProviderRepositoryPanel >> remoteUrl [
	
	| builder |
	builder := IceUrlBuilder new
		protocol: self selectedProtocol new;
		username: self userName project: self projectName.
	self configureBuilder: builder.
	^ builder buildUrl
]

{ #category : #accessing }
IceTipGitProviderRepositoryPanel >> selectedProtocol [

	^ self protocolDropList selectedItem
]

{ #category : #accessing }
IceTipGitProviderRepositoryPanel >> userName [

	^ self userNameInputText text asString trimmed
]

{ #category : #'accessing ui' }
IceTipGitProviderRepositoryPanel >> userNameInputText [

	^ userNameInputText
]

{ #category : #'accessing ui' }
IceTipGitProviderRepositoryPanel >> userNameLabel [

	^ userNameLabel
]

{ #category : #accessing }
IceTipGitProviderRepositoryPanel >> validate [

	self
		assert: self userName isNotEmpty
		description: 'You must enter a GitHub username.'.
	self
		assert: self projectName isNotEmpty
		description: 'You must enter a GitHub project.'.
	super validate
]
