"
I'm a the abstract superclass of commands that act on remotes. 
"
Class {
	#name : #IceTipRemoteActionCommand2,
	#superclass : #IceTipRepositoryCommand2,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipRemoteActionCommand2 class >> isAbstract [ 
	^ self == IceTipRemoteActionCommand2
]

{ #category : #testing }
IceTipRemoteActionCommand2 >> canBeExecuted [

	^ self context isRepositoryOperational
		and: [ self context repositoryModel hasRemotes ]
]

{ #category : #validating }
IceTipRemoteActionCommand2 >> validateRemotesPresent [

	self repositoryModel hasRemotes
		ifFalse: [ IceNoRemote signal ]
]
