"
I represent the commands that execute on certain repository's remote.
"
Class {
	#name : #IceGitHubRemoteCommand,
	#superclass : #IceGitHubCommand,
	#category : #'Iceberg-Plugin-GitHub-Commands'
}

{ #category : #testing }
IceGitHubRemoteCommand class >> isAbstract [

	^ self == IceGitHubRemoteCommand
]

{ #category : #accessing }
IceGitHubRemoteCommand >> repositoryModel [

	^ self remoteModel repositoryModel

]
