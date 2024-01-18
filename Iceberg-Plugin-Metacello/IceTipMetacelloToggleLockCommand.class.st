Class {
	#name : 'IceTipMetacelloToggleLockCommand',
	#superclass : 'IceTipMetacelloInstallBaselineCommand',
	#category : 'Iceberg-Plugin-Metacello',
	#package : 'Iceberg-Plugin-Metacello'
}

{ #category : 'accessing' }
IceTipMetacelloToggleLockCommand >> baselineName [

	^ self packageName allButFirst: 10
]

{ #category : 'accessing' }
IceTipMetacelloToggleLockCommand >> description [

	^ 'Toggle lock/unlock baseline.'
]

{ #category : 'executing' }
IceTipMetacelloToggleLockCommand >> execute [
	| metacello |

	metacello := Metacello new 
		baseline: self baselineName; 
		yourself.
	
	self isLocked 
		ifTrue: [ metacello unlock ]
		ifFalse: [ metacello lock ].
		
	context ifNotNil: [ context refresh ]
]

{ #category : 'accessing' }
IceTipMetacelloToggleLockCommand >> iconName [

	^ #smallLock
]

{ #category : 'testing' }
IceTipMetacelloToggleLockCommand >> isBaseline [
	
	self packageModel ifNil: [ ^ false ]. 
	^ self packageName beginsWith: 'BaselineOf'
]

{ #category : 'accessing' }
IceTipMetacelloToggleLockCommand >> isLocked [
	
	self isBaseline ifFalse: [ ^ false ].
	
	^ (MetacelloProjectRegistration 
		projectSpecForClassNamed: self package name 
		ifAbsent: [ ^ false ])
		isLocked
]

{ #category : 'accessing' }
IceTipMetacelloToggleLockCommand >> name [ 

	self isBaseline ifFalse: [ ^ 'Lock/Unlock' ].

	^ self isLocked 
		ifTrue: [ 'Unlock {1}' format: { self baselineName } ]
		ifFalse: [ 'Lock {1}' format: { self baselineName } ]
]

{ #category : 'accessing' }
IceTipMetacelloToggleLockCommand >> packageName [
	
	^ self package name
]
