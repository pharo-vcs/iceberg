"
I represent the commands that execute on certain repository's remote.
"
Class {
	#name : 'IceGitHubRemoteCommand',
	#superclass : 'IceGitHubCommand',
	#instVars : [
		'remoteModel'
	],
	#category : 'Iceberg-Plugin-GitHub-Commands',
	#package : 'Iceberg-Plugin-GitHub',
	#tag : 'Commands'
}

{ #category : 'testing' }
IceGitHubRemoteCommand class >> isAbstract [

	^ self == IceGitHubRemoteCommand
]

{ #category : 'accessing' }
IceGitHubRemoteCommand >> remote [

	^ self remoteModel entity
]

{ #category : 'accessing' }
IceGitHubRemoteCommand >> remoteModel [

	^ remoteModel
]

{ #category : 'accessing' }
IceGitHubRemoteCommand >> remoteModel: aModel [

	remoteModel := aModel
]

{ #category : 'accessing' }
IceGitHubRemoteCommand >> repositoryModel [

	^ self remoteModel repositoryModel

]
