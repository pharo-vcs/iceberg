"
I'm a command to perform a fetch operation on selected project.
"
Class {
	#name : 'IceTipFetchCommand',
	#superclass : 'IceTipRepositoryCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipFetchCommand class >> defaultDescription [

	^ 'Fetch (bring new commits) from this repositories.'
]

{ #category : 'accessing - defaults' }
IceTipFetchCommand class >> defaultName [

	^ 'Fetch'
]

{ #category : 'testing' }
IceTipFetchCommand >> canBeExecuted [

	^ super canBeExecuted and: [ 
		  self isRepositoryMissing not and: [ 
			  self repositoryModel hasRemotes ] ]
]

{ #category : 'executing' }
IceTipFetchCommand >> execute [

	self repositoryModel newFetchAction executeWithContext: self context
]

{ #category : 'accessing' }
IceTipFetchCommand >> iconName [

	^ #smallUpdate
]

{ #category : 'accessing' }
IceTipFetchCommand >> shortcutKey [

	^ $f meta
]
