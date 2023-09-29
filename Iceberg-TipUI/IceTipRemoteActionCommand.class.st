"
I'm a the abstract superclass of commands that act on remotes. 
"
Class {
	#name : 'IceTipRemoteActionCommand',
	#superclass : 'IceTipRepositoryCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'testing' }
IceTipRemoteActionCommand class >> isAbstract [ 
	^ self == IceTipRemoteActionCommand
]

{ #category : 'testing' }
IceTipRemoteActionCommand >> canBeExecuted [

	^ self isRepositoryOperational
		and: [ self repositoryModel hasRemotes ]
]

{ #category : 'validating' }
IceTipRemoteActionCommand >> validateRemotesPresent [

	self repositoryModel hasRemotes
		ifFalse: [ IceNoRemote signal ]
]
