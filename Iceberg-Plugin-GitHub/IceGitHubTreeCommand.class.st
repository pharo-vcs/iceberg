"
I represent all the Github commands that work on a Tree item
"
Class {
	#name : #IceGitHubTreeCommand,
	#superclass : #IceGitHubCommand,
	#category : #'Iceberg-Plugin-GitHub-Commands'
}

{ #category : #testing }
IceGitHubTreeCommand >> actsOnBranch: anIceTipTreeBranch [

	^ false
]

{ #category : #testing }
IceGitHubTreeCommand >> actsOnRemote: aRemoteModel [

	^ true
]

{ #category : #testing }
IceGitHubTreeCommand >> actsOnTag: aRemoteModel [

	^ false
]

{ #category : #testing }
IceGitHubTreeCommand >> canBeExecuted [

	^ self item notNil and: [(self item canActivateCommand: self) and: [super canBeExecuted]]
]

{ #category : #accessing }
IceGitHubTreeCommand >> remote [

	^ self item model entity
]
