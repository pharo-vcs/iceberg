"
A decorator to react to the fact that a package is a Baseline
"
Class {
	#name : 'IceTipMetacelloBaselineDecorator',
	#superclass : 'IceTipDecorator',
	#category : 'Iceberg-Plugin-Metacello',
	#package : 'Iceberg-Plugin-Metacello'
}

{ #category : 'accessing' }
IceTipMetacelloBaselineDecorator >> iconNameForPackage: aPackage [

	(self isBaseline: aPackage) ifFalse: [ ^ nil ].
	
	^ (self isLocked: aPackage)
		ifTrue: [ #smallLock ]
		ifFalse: [ #package ]
]

{ #category : 'testing' }
IceTipMetacelloBaselineDecorator >> isBaseline: aPackage [
	
	^ aPackage name beginsWith: 'BaselineOf'
]

{ #category : 'testing' }
IceTipMetacelloBaselineDecorator >> isLocked: aPackage [
	
	^ (MetacelloProjectRegistration 
		projectSpecForClassNamed: aPackage name 
		ifAbsent: [ ^ false ])
		isLocked
]
