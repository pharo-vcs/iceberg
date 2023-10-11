"
I'm a generic command  for iceberg repositories.
"
Class {
	#name : 'IceRepositoryCommand',
	#superclass : 'Object',
	#instVars : [
		'repository',
		'success',
		'context'
	],
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'testing' }
IceRepositoryCommand class >> isAbstract [

	^ self == IceRepositoryCommand
]

{ #category : 'accessing' }
IceRepositoryCommand >> beSuccess [
	success := true
]

{ #category : 'execute' }
IceRepositoryCommand >> execute [ 
	self subclassResponsibility
]

{ #category : 'execute' }
IceRepositoryCommand >> executeWithContext: aContext [

	context := aContext.
	self execute
]

{ #category : 'initialization' }
IceRepositoryCommand >> initialize [
	super initialize.
	success := false
]

{ #category : 'testing' }
IceRepositoryCommand >> isSuccess [
	^ success
]

{ #category : 'accessing' }
IceRepositoryCommand >> repository [
	^ repository
]

{ #category : 'accessing' }
IceRepositoryCommand >> repository: anObject [
	repository := anObject
]
