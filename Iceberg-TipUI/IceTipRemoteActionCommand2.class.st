"
I'm a the abstract superclass of commands that act on remotes. 
"
Class {
	#name : #IceTipRemoteActionCommand2,
	#superclass : #IceTipRepositoryCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipRemoteActionCommand2 class >> isAbstract [ 
	^ self == IceTipRemoteActionCommand2
]

{ #category : #testing }
IceTipRemoteActionCommand2 >> canBeExecuted [

	^ self isRepositoryOperational
		and: [ self repositoryModel hasRemotes ]
]

{ #category : #validating }
IceTipRemoteActionCommand2 >> validateRemotesPresent [

	self repositoryModel hasRemotes
		ifFalse: [ IceNoRemote signal ]
]
