"
Base abstract class for SCP and HTTPS remotes.
"
Class {
	#name : 'IceGitNetworkRemote',
	#superclass : 'IceGitRemote',
	#instVars : [
		'user',
		'host',
		'port',
		'path',
		'owner'
	],
	#category : 'Iceberg-Libgit-Core',
	#package : 'Iceberg-Libgit',
	#tag : 'Core'
}

{ #category : 'testing' }
IceGitNetworkRemote class >> canHandleUrl: aString [ 
	"I am abstract I can't handle any url."
	^ false
]

{ #category : 'accessing - defaults' }
IceGitNetworkRemote class >> defaultPort [
	^self subclassResponsibility
]

{ #category : 'testing' }
IceGitNetworkRemote class >> isAbstract [

	^ self == IceGitNetworkRemote 
]

{ #category : 'accessing' }
IceGitNetworkRemote >> detailedInfo [
	^ { 
		'Origin' -> self url.
		"'Remote User' -> self userName."
		'Remote host' -> (self port = self class defaultPort ifTrue: [ self host ] ifFalse: [self host, ':', self portName]).
		'Repo Owner' -> self owner.
	} 
]

{ #category : 'accessing' }
IceGitNetworkRemote >> host [
	^ host
]

{ #category : 'querying' }
IceGitNetworkRemote >> organizer [
	^ self owner
]

{ #category : 'accessing' }
IceGitNetworkRemote >> owner [
	 ^ owner
]

{ #category : 'accessing' }
IceGitNetworkRemote >> parseUrl [
	| znUrl |
	znUrl := ZnUrl fromString: url.
	user := znUrl username.
	host := znUrl host.
	port := znUrl port ifNil: [self class defaultPort].

	path := znUrl segments allButLast: (2 min: znUrl segments size).
	
	znUrl segments size >= 2
		ifTrue: [ owner := (znUrl segments last: 2) first ].

	projectName := self stripPossibleExtension: (znUrl segments last).
]

{ #category : 'accessing' }
IceGitNetworkRemote >> path [
	^path ifNil: [ path := OrderedCollection new ].
]

{ #category : 'accessing' }
IceGitNetworkRemote >> port [

	^port ifNil: [ self class defaultPort ]
]

{ #category : 'accessing' }
IceGitNetworkRemote >> portName [
	^self port asString
]

{ #category : 'accessing' }
IceGitNetworkRemote >> projectPath [

	| projectPath |
	"Work on a copy of the path"
	projectPath := OrderedCollection withAll: self path.
	self owner ifNotNil: [ projectPath add: self owner ].
	projectPath add: self projectName.
	^ (RelativePath withAll: projectPath) pathString
]

{ #category : 'comparing' }
IceGitNetworkRemote >> referencesSameRemoteLocationAs: another [

	^ (self httpsUrl withoutSuffix: '.git') sameAs:
		  (another httpsUrl withoutSuffix: '.git')
]

{ #category : 'private' }
IceGitNetworkRemote >> stripPossibleExtension: aString [
	^ (aString endsWith: '.git')
		ifTrue: [ aString allButLast: 4 ]
		ifFalse: [ aString ]
]

{ #category : 'accessing' }
IceGitNetworkRemote >> user [
	^user
]

{ #category : 'accessing' }
IceGitNetworkRemote >> userName [
	^user ifNil: [ '' ]
	

]
