"
I just perform the push using GIT command line tool
"
Class {
	#name : 'IceGitCommandLinePush',
	#superclass : 'AbstractIceGitCommandLineAction',
	#instVars : [
		'repository',
		'branch',
		'remote'
	],
	#category : 'Iceberg-Libgit-GitActions',
	#package : 'Iceberg-Libgit',
	#tag : 'GitActions'
}

{ #category : 'accessing' }
IceGitCommandLinePush >> branch: anIceGitLocalBranch [ 
	
	branch := anIceGitLocalBranch
]

{ #category : 'executing' }
IceGitCommandLinePush >> execute [

	| args succedded stdOut stdErr |

	args := Array streamContents: [ :s |
			        s
				        nextPut: 'push';
				        nextPut: '--progress';
			       	  nextPut: remote name ].

	self
		executeSubProcess: 'git'
		arguments: args
		workingDirectory: repository location
		onExit: [ :process :outString :errString |
				succedded := process isSuccess.
				stdOut := outString.
				stdErr := errString ].

	succedded ifFalse: [ IceGenericError signal: stdErr ]
]

{ #category : 'accessing' }
IceGitCommandLinePush >> remote: anIceGitScpRemote [

	remote := anIceGitScpRemote
]

{ #category : 'accessing' }
IceGitCommandLinePush >> repository: anIceLibgitRepository [ 
	
	repository := anIceLibgitRepository
]
