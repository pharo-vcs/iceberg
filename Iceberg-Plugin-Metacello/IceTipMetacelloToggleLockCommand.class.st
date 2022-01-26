Class {
	#name : #IceTipMetacelloToggleLockCommand,
	#superclass : #IceTipMetacelloInstallBaselineCommand,
	#category : #'Iceberg-Plugin-Metacello'
}

{ #category : #accessing }
IceTipMetacelloToggleLockCommand >> baselineName [

	^ self package name allButFirst: 10
]

{ #category : #executing }
IceTipMetacelloToggleLockCommand >> execute [
	| metacello |

	metacello := Metacello new 
		baseline: self baselineName; 
		yourself.
	
	self isLocked 
		ifTrue: [ metacello unlock ]
		ifFalse: [ metacello lock ]
]

{ #category : #accessing }
IceTipMetacelloToggleLockCommand >> iconName [

	^ #lock
]

{ #category : #testing }
IceTipMetacelloToggleLockCommand >> isBaseline [
	
	^ self packageName beginsWith: 'BaselineOf'
]

{ #category : #accessing }
IceTipMetacelloToggleLockCommand >> isLocked [
	
	self packageModel ifNil: [ ^ false ].
	^ (MetacelloProjectRegistration 
		projectSpecForClassNamed: self package name 
		ifAbsent: [ ^ false ])
		isLocked
]

{ #category : #accessing }
IceTipMetacelloToggleLockCommand >> name [ 

	(self packageModel isNil 
		or: [ self isBaseline not ])
		ifTrue: [ ^ 'Lock/Unlock' ].

	^ self isLocked 
		ifTrue: [ 'Unlock {1}' format: { self baselineName } ]
		ifFalse: [ 'Lock {1}' format: { self baselineName } ]
]

{ #category : #accessing }
IceTipMetacelloToggleLockCommand >> packageName [
	
	^ self package name
]
