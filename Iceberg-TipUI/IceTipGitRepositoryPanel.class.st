"
I'm a presenter to define remote repositories.
Repositories needs to have a valid url (one that can be parsed by IceRemote) and a valid location (where to place the clone)
"
Class {
	#name : 'IceTipGitRepositoryPanel',
	#superclass : 'IceTipRepositoryTypePanel',
	#category : 'Iceberg-TipUI-View-Repository',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Repository'
}

{ #category : 'accessing' }
IceTipGitRepositoryPanel class >> order [

	^ 1000 "to the end"
]

{ #category : 'layout' }
IceTipGitRepositoryPanel >> defaultLayout [

	^ SpGridLayout new 
		beColumnNotHomogeneous;
		column: 2 expand: true;
		build: [ :builder | builder
			add: remoteLabel; add: remoteInputText; nextRow;
			add: projectLocationLabel; add: projectLocation; nextRow ];
		yourself
]

{ #category : 'utilities' }
IceTipGitRepositoryPanel >> extractProjectNameAndOwner: aString into: aBlock [

	| remote |

	^ [
		  remote := IceGitRemote url: aString.
		  aBlock value: remote owner value: remote projectName ]
		  on: IceWrongUrl
		  do: [ aBlock value: nil value: 'invalid-url' ]
]

{ #category : 'initialization' }
IceTipGitRepositoryPanel >> initializePresenters [

	super initializePresenters.
	self initializeRemoteURL.

	self remoteInputText
		placeholder: 'e.g., ssh://[user@]host.xz[:port]/path/to/repo.git'.
	self remoteInputText whenTextChangedDo: [ :text |
		self 
			extractProjectNameAndOwner: text 
			into: [ :anOwner :projectName | 
				anOwner 
					ifNil: [ self projectLocation appendPath: projectName ]
					ifNotNil: [ self projectLocation appendPath: (anOwner , DiskStore delimiter asString , projectName)  ]] ].

]

{ #category : 'accessing' }
IceTipGitRepositoryPanel >> newRepository [

	^ self application
		informUser: ('Cloning repository {1}' format: { self remoteUrl })
		during: [
			IceRepositoryCreator new
				  repository: repository;
				  remote: (IceGitRemote url: self remoteUrl);
				  location: self projectLocation location;
				  createRepository ]
]

{ #category : 'accessing' }
IceTipGitRepositoryPanel >> remoteUrl [

	^ self remoteInputText text asString trimmed
]

{ #category : 'accessing' }
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
		assert: self projectLocation location isNotNil
		description:
		'Project location must be defined (if it does not exists, it will be created).'
]

{ #category : 'initialization' }
IceTipGitRepositoryPanel >> windowIcon [

	^ self iconNamed: #git
]

{ #category : 'initialization' }
IceTipGitRepositoryPanel >> windowTitle [

	^ 'Clone remote repository'
]
