Class {
	#name : #IceGitHubRemoteCommand,
	#superclass : #IceGitHubCommand,
	#category : #'Iceberg-Plugin-GitHub-Commands'
}

{ #category : #accessing }
IceGitHubRemoteCommand >> repositoryModel [

	^ self remoteModel repositoryModel

]
