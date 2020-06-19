"
I'm a cached model. 
I take all unary messages sent to my realObject and I cache their values. 
I keep a cache with rules for reset it, which can be accessedon the #resetOn: family of messages.
"
Class {
	#name : #IceTipCachedModel,
	#superclass : #Object,
	#instVars : [
		'realObject',
		'cache'
	],
	#category : #'Iceberg-TipUI-Model'
}

{ #category : #'instance creation' }
IceTipCachedModel class >> for: anObject [
	^ self basicNew initializeObject: anObject
]

{ #category : #accessing }
IceTipCachedModel >> = aObject [ 
	self species ~= aObject species
	ifTrue: [^ false].
	^ self realObject = aObject realObject
]

{ #category : #'reflective operations' }
IceTipCachedModel >> doesNotUnderstand: aMessage [
	aMessage selector isUnary
		ifTrue: [ 
			cache 
				at: aMessage selector
				ifPresent: [ :value | ^ value ].
			 (self realObject class lookupSelector: aMessage selector)
				ifNotNil: [ :method |
					(method hasPragmaNamed: #noCache)
						ifFalse: [ 
							^ cache
								at: aMessage selector 
								put: (self forwardMessage: aMessage) ] ] ].
	^ self forwardMessage: aMessage
]

{ #category : #'reflective operations' }
IceTipCachedModel >> forwardMessage: aMessage [
	^ realObject 
		perform: aMessage selector 
		withArguments: aMessage arguments 
]

{ #category : #comparing }
IceTipCachedModel >> hash [
	^ self realObject hash
]

{ #category : #initialization }
IceTipCachedModel >> initializeObject: anObject [
	realObject := anObject.
	cache := IceTipCache proxy: self.
	self initialize
]

{ #category : #printing }
IceTipCachedModel >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	self realObject printOn: aStream.
	aStream nextPut: $)
]

{ #category : #accessing }
IceTipCachedModel >> realObject [
	^ realObject
]

{ #category : #accessing }
IceTipCachedModel >> reset [
	cache reset
]
