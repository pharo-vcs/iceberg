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
IceTipGitRepositoryPanel >> extractProjectName: aString [

	^ [ (IceGitRemote url: aString) projectName ]
		  on: IceWrongUrl
		  do: [ 'invalid-url' ]
]

{ #category : 'initialization' }
IceTipGitRepositoryPanel >> initializePresenters [

	super initializePresenters.
	self initializeRemoteURL.

	self remoteInputText
		placeholder: 'e.g., ssh://[user@]host.xz[:port]/path/to/repo.git'.
	self remoteInputText whenTextChangedDo: [ :text |
		self projectLocation appendPath: (self extractProjectName: text) ].

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
	remoteString isEmpty ifTrue: [
		IceError signal: 'You must enter your project url.' ].
	(IceGitRemote isValidUrl: remoteString) ifFalse: [
		IceError signal: 'The url is incorrect.' ].
	self projectLocation location ifNil: [
			IceError signal:
				'Project location must be defined (if it does not exists, it will be created).' ]
]

{ #category : 'initialization' }
IceTipGitRepositoryPanel >> windowIcon [

	^ self iconNamed: #git
]

{ #category : 'initialization' }
IceTipGitRepositoryPanel >> windowTitle [

	^ 'Clone remote repository'
]
