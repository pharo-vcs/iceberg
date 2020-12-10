"
I'm a command to perform a fetch operation on selected project.
"
Class {
	#name : #IceTipFetchCommand,
	#superclass : #IceTipRepositoryCommand2,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipFetchCommand class >> defaultDescription [

	^ 'Fetch (bring new commits) from this repositories.'
]

{ #category : #accessing }
IceTipFetchCommand class >> defaultName [

	^ 'Fetch'
]

{ #category : #testing }
IceTipFetchCommand >> canBeExecuted [

	^ self context isRepositoryMissing not and: [ 
		  self context repositoryModel hasRemotes ]
]

{ #category : #execution }
IceTipFetchCommand >> execute [

	self repositoryModel fetch
]

{ #category : #accessing }
IceTipFetchCommand >> iconName [

	^ #smallUpdate
]
