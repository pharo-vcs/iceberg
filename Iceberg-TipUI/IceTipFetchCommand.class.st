"
I'm a command to perform a fetch operation on selected project.
"
Class {
	#name : #IceTipFetchCommand,
	#superclass : #IceTipRepositoryCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #'accessing - defaults' }
IceTipFetchCommand class >> defaultDescription [

	^ 'Fetch (bring new commits) from this repositories.'
]

{ #category : #'accessing - defaults' }
IceTipFetchCommand class >> defaultName [

	^ 'Fetch'
]

{ #category : #testing }
IceTipFetchCommand >> canBeExecuted [

	^ self isRepositoryMissing not and: [ 
		  self repositoryModel hasRemotes ]
]

{ #category : #executing }
IceTipFetchCommand >> execute [

	self repositoryModel fetch
]

{ #category : #accessing }
IceTipFetchCommand >> iconName [

	^ #smallUpdate
]

{ #category : #accessing }
IceTipFetchCommand >> shortcutKey [

	^ $f meta
]
