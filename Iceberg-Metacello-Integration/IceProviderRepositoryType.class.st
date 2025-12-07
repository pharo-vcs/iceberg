"
I 'm a base class to resolve provider-based repositories.
A provider repositoy is composed of: 

provider://username/repository[:commitish][/subdir]

provider  	- The provider identifier (e.g. github, bitbucket, etc.)
username 	- The provider user
repository	- The provider repository
commitish	- an optional commitish (a branch, a tag, a commit id)
subdir		- an optional subdirectory where the packages exist.
		
Example: 
------------
A script to install voyage using this would like more or less like this:

Metacello new
	repository: 'github//pharo-nosql/voyage:master/mc';
	baseline: 'Voyage';
	load: 'mongo tests'.
"
Class {
	#name : 'IceProviderRepositoryType',
	#superclass : 'IceMetacelloRepositoryType',
	#category : 'Iceberg-Metacello-Integration-RepoTypes',
	#package : 'Iceberg-Metacello-Integration',
	#tag : 'RepoTypes'
}

{ #category : 'testing' }
IceProviderRepositoryType class >> isAbstract [
	^ super isAbstract
		or: [ self = IceProviderRepositoryType ]
]

{ #category : 'accessing' }
IceProviderRepositoryType >> guessRegisteredRepository [
	"I get the project name and try to find it into the already registered projects. 
	 If I find it, I will use this instead cloning a new one."

	^ IceRepository registry 
		detect: [ : each | each name = self projectName ] 
		ifNone: [ nil ]
]

{ #category : 'accessing' }
IceProviderRepositoryType >> mcRepository [

	| baseRepo |
	self guessRegisteredRepository ifNotNil: [ :repo |
		repo isValid ifTrue: [ ^ repo metacelloAdapter: self projectVersion ].
		"If the repo is not valid, we forget it and reget a new one.
			Because Metacello want to use it"
		repo forget ].

	baseRepo := self mcRepositoryClass 
		location: self location 
		version: (self projectVersion ifEmpty: [ nil ]).
	^ (Iceberg icebergRepositoriesURLs includes: baseRepo scpUrl)
		  ifTrue: [ "Do not use Iceberg to load iceberg code, 
			see https://github.com/pharo-vcs/iceberg/issues/168"
			  baseRepo ]
		  ifFalse: [
			  baseRepo getOrCreateIcebergRepository metacelloAdapter: self projectVersion ]
]

{ #category : 'accessing' }
IceProviderRepositoryType >> mcRepositoryClass [

	^ (MCGitBasedNetworkRepository allSubclasses 
		reject: [ :each | each isAbstract ])
		detect: [ :each | each basicDescription = self class type ]
]

{ #category : 'accessing' }
IceProviderRepositoryType >> projectName [

	| parts mightBeProjectName |

	"I need to handle the possibility that there are subprojects"
	parts := self location substrings: '/'.
	mightBeProjectName := parts allButFirst: 2.
	
	^ mightBeProjectName 
		detect: [ :e | e includes: $: ]
		ifFound: [ :e | e copyUpTo: $: ]
		ifNone: [ parts third ]
]

{ #category : 'accessing' }
IceProviderRepositoryType >> projectVersion [

	"I need to handle the possibility that there are subprojects"
	| parts mightBeProjectName |
	parts := self location substrings: '/'.
	mightBeProjectName := parts allButFirst: 2.
	
	^ mightBeProjectName 
		detect: [ :e | e includes: $: ]
		ifFound: [ :e | e copyAfter: $: ]
		ifNone: [ '' ]


]
