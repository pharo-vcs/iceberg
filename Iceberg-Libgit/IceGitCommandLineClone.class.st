"
I just perform the clone using GIT command line tool
"
Class {
	#name : 'IceGitCommandLineClone',
	#superclass : 'AbstractIceGitCommandLineAction',
	#instVars : [
		'location',
		'url'
	],
	#category : 'Iceberg-Libgit-GitActions',
	#package : 'Iceberg-Libgit',
	#tag : 'GitActions'
}

{ #category : 'executing' }
IceGitCommandLineClone >> execute [

	| repoDirectory parent succedded stdOut stdErr |

	location exists ifTrue: [
		IceCloneLocationAlreadyExists signalFor: location ].

	repoDirectory := location basename.
	parent := location parent.
	parent ensureCreateDirectory.
	
	self 
		executeSubProcess: 'git'
		arguments: {
				'clone'.
				'--progress'.
				url.
				repoDirectory }
		workingDirectory: parent 
		onExit: [ :process :outString :errString |
					succedded := process isSuccess.
					stdOut := outString.
					stdErr := errString ].

	succedded 
		ifFalse: [ 
			location ensureDeleteAll.
			(stdErr includesSubstring: 'Permission denied (publickey)') ifTrue: [ IceAuthenticationError signal: stdErr ].
			IceGenericError signal: stdErr ].
]

{ #category : 'accessing' }
IceGitCommandLineClone >> location: aFileLocator [ 
	location := aFileLocator
]

{ #category : 'executing' }
IceGitCommandLineClone >> updateJobStatus: outputString [

	| job lines lastLine progress matches |
	job := CurrentJob value.
	job ifNil: [ ^ self ].

	lines := outputString lines.
	lines ifEmpty: [ ^ self ].
	
	lastLine := lines last.
	progress := 0.
	
	(lastLine includesSubstring: 'Counting objects')
		ifTrue: [progress := 0].	
		
	(lastLine includesSubstring: 'Compressing objects')
		ifTrue: [progress := 25].	
			
	(lastLine includesSubstring: 'Receiving objects')
		ifTrue: [progress := 50].

	(lastLine includesSubstring: 'Resolving deltas')
		ifTrue: [progress := 75].
		
	(lastLine includesSubstring: 'done.')
		ifTrue: [progress := 100].
	
	matches := lastLine allRegexMatches: '(\d+)%'.
	matches ifNotEmpty: [  
		progress := progress + (matches first allButLast asNumber / 4)
	].
		
	progress ifNil: [ ^ self ].
	
	job value: progress
]

{ #category : 'accessing' }
IceGitCommandLineClone >> url: aString [ 
	url := aString
]
