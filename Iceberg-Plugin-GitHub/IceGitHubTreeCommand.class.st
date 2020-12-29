"
I represent all the Github commands that work on a Tree item
"
Class {
	#name : #IceGitHubTreeCommand,
	#superclass : #IceGitHubCommand,
	#category : #'Iceberg-Plugin-GitHub-Commands'
}

{ #category : #testing }
IceGitHubTreeCommand class >> actsOnBranch: anIceTipTreeBranch [

	^ false
]

{ #category : #testing }
IceGitHubTreeCommand class >> actsOnRemote: aRemoteModel [

	^ true
]

{ #category : #testing }
IceGitHubTreeCommand class >> actsOnTag: aRemoteModel [

	^ false
]

{ #category : #testing }
IceGitHubTreeCommand >> canBeExecuted [

	^ super canBeExecuted and: [ 
		  self item canActivateCommand: self ]
]

{ #category : #accessing }
IceGitHubTreeCommand >> remote [

	^ self item model entity
]
