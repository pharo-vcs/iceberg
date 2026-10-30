"
I'm a command to perform a fetch operation on all registered projects.
"
Class {
	#name : 'IceTipFetchAllProjectCommand',
	#superclass : 'IceTipRepositoryCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipFetchAllProjectCommand class >> defaultDescription [

	^ 'Fetch (bring new commits) from all repositories in your list.'
]

{ #category : 'accessing - defaults' }
IceTipFetchAllProjectCommand class >> defaultName [

	^ 'Fetch all'
]

{ #category : 'testing' }
IceTipFetchAllProjectCommand >> canBeExecuted [ 
	
	"This command can be executed with our without selection"
	^ true
]

{ #category : 'executing' }
IceTipFetchAllProjectCommand >> execute [

	self isConfirmed ifFalse: [ ^ self ].
	IceRepository registry do: [ :each | each fetchInBackground ]
]

{ #category : 'accessing' }
IceTipFetchAllProjectCommand >> iconName [

	^ #smallUpdate
]

{ #category : 'executing' }
IceTipFetchAllProjectCommand >> isConfirmed [

	^ self application newConfirm
		  title: 'Proceed?';
		  message:
			  'This operation can take some times depending on the size and number of your repositories. Are you sure you want to fetch all repositories?';
		  openModal
]
