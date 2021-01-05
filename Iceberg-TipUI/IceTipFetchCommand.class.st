"
I'm a command to perform a fetch operation on selected project.
"
Class {
	#name : #IceTipFetchCommand,
	#superclass : #IceTipRepositoryCommand,
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

	^ self isRepositoryMissing not and: [ 
		  self repositoryModel hasRemotes ]
]

{ #category : #execution }
IceTipFetchCommand >> execute [

	self repositoryModel fetch
]

{ #category : #accessing }
IceTipFetchCommand >> iconName [

	^ #smallUpdate
]
