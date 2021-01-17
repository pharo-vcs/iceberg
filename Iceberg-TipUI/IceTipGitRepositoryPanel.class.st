"
I'm a presenter to define remote repositories.
Repositories needs to have a valid url (one that can be parsed by IceRemote) and a valid location (where to place the clone)
"
Class {
	#name : #IceTipGitRepositoryPanel,
	#superclass : #IceTipRepositoryTypePanel,
	#category : #'Iceberg-TipUI-View-RepositoryType'
}

{ #category : #specs }
IceTipGitRepositoryPanel class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: (SpBoxLayout newHorizontal
				   add: #remoteLabel width: self labelWidth;
				   add: #remoteInputText;
				   yourself)
		  height: self inputTextHeight;
		  add: #projectLocation height: self inputTextHeight;
		  yourself
]

{ #category : #accessing }
IceTipGitRepositoryPanel class >> order [

	^ 1000 "to the end"
]

{ #category : #utilities }
IceTipGitRepositoryPanel >> extractProjectName: aString [

	^ [ (IceGitRemote url: aString) projectName ]
		  on: IceWrongUrl
		  do: [ 'invalid-url' ]
]

{ #category : #initialization }
IceTipGitRepositoryPanel >> iconForWindow [

	^ self iconNamed: #git
]

{ #category : #initialization }
IceTipGitRepositoryPanel >> initializePresenters [

	super initializePresenters.
	self initializeRemoteURL.

	self remoteInputText
		placeholder: 'e.g., ssh://[user@]host.xz[:port]/path/to/repo.git'.
	self remoteInputText whenTextChangedDo: [ :text |
		self projectLocation appendPath: (self extractProjectName: text) ].

]

{ #category : #accessing }
IceTipGitRepositoryPanel >> newRepository [

	UIManager default 
		informUser: ('Cloning repository {1}' format: { self remoteUrl })
		during: [ 
			^ IceRepositoryCreator new 
				repository: repository;
				remote: (IceGitRemote url: self remoteUrl);
				location: self projectLocation location;
				createRepository ]
]

{ #category : #accessing }
IceTipGitRepositoryPanel >> remoteUrl [

	^ self remoteInputText text asString trimmed
]

{ #category : #initialization }
IceTipGitRepositoryPanel >> titleForWindow [

	^ 'Clone remote repository'
]

{ #category : #accessing }
IceTipGitRepositoryPanel >> validate [

	| remoteString |
	remoteString := self remoteUrl.
	self
		assert: remoteString isNotEmpty
		description: 'You must enter your project url.'.
	self
		assert: (IceGitRemote isValidUrl: remoteString)
		description: 'The url is incorrect.'.
	self
		assert: self projectLocation location notNil
		description:
		'Project location must be defined (if it does not exists, it will be created).'
]
