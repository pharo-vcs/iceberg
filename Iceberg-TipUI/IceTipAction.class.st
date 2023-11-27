"
I'm like a lightweight command, used in general for apply concrete actions. 
"
Class {
	#name : 'IceTipAction',
	#superclass : 'Object',
	#instVars : [
		'context',
		'repository',
		'successBlock'
	],
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'testing' }
IceTipAction class >> isAbstract [

	^ self == IceTipAction
]

{ #category : 'private' }
IceTipAction >> application [

	^ context application
]

{ #category : 'executing' }
IceTipAction >> basicExecute [
	self subclassResponsibility

]

{ #category : 'accessing' }
IceTipAction >> context [

	^ context
]

{ #category : 'accessing' }
IceTipAction >> context: aContext [

	context := aContext
]

{ #category : 'executing' }
IceTipAction >> execute [

	| result |
	
	self withErrorHandlingDo: [ 
		result := self basicExecute.
		self finishSuccess ].
	
	^ result.
]

{ #category : 'executing' }
IceTipAction >> executeWithContext: aContext [

	self context: aContext.
	^ self execute
]

{ #category : 'private' }
IceTipAction >> finishSuccess [
	successBlock ifNotNil: [ successBlock value ]
]

{ #category : 'accessing' }
IceTipAction >> onSuccess: aBlock [ 
	"Some actions need to execute something right after finish. Like a refresh of panels, etc.
	 If a block is defined here, it will be evaluated right after the command is executed, if 
	 there are no exceptions."
	successBlock := aBlock
]

{ #category : 'accessing' }
IceTipAction >> repository [
	^ repository
]

{ #category : 'accessing' }
IceTipAction >> repository: anObject [
	repository := anObject
]

{ #category : 'private' }
IceTipAction >> withErrorHandlingDo: aBlock [
	aBlock
	on: IceError, IceWarning
	do: [ :e | 
		e acceptError: (IceTipInteractiveErrorVisitor 
			newContext: self context 
			repository: self repository) ].

]
