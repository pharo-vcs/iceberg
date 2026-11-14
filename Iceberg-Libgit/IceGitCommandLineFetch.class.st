"
I just perform the fetch using GIT command line tool
"
Class {
	#name : 'IceGitCommandLineFetch',
	#superclass : 'AbstractIceGitCommandLineAction',
	#instVars : [
		'remote',
		'repository',
		'spec'
	],
	#category : 'Iceberg-Libgit-GitActions',
	#package : 'Iceberg-Libgit',
	#tag : 'GitActions'
}

{ #category : 'executing' }
IceGitCommandLineFetch >> execute [
	
	| args succedded stdOut stdErr |
	args := Array streamContents: [:s |
				s 
					nextPut: 'fetch';
					nextPut: '--progress'.
				spec ifNotNil: [ 
					s nextPut: remote name.
					s print: spec ]].
	
	self 
		executeSubProcess: 'git'
		arguments: args
		workingDirectory: repository location 
		onExit: [ :process :outString :errString |
					succedded := process isSuccess.
					stdOut := outString.
					stdErr := errString ].
				
	succedded ifFalse: [ IceGenericError signal: stdErr]
]

{ #category : 'accessing' }
IceGitCommandLineFetch >> remote [

	^ remote
]

{ #category : 'accessing' }
IceGitCommandLineFetch >> remote: anObject [

	remote := anObject
]

{ #category : 'accessing' }
IceGitCommandLineFetch >> repository [

	^ repository
]

{ #category : 'accessing' }
IceGitCommandLineFetch >> repository: anObject [

	repository := anObject
]

{ #category : 'accessing' }
IceGitCommandLineFetch >> spec [

	^ spec
]

{ #category : 'accessing' }
IceGitCommandLineFetch >> spec: anObject [

	spec := anObject
]
