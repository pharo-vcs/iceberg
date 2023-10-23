"
I represent a test parameter, including a set of possible values for each parameter. See ParameterizedTest for more information about usage.
"
Class {
	#name : 'IceTestParameter',
	#superclass : 'Object',
	#instVars : [
		'options'
	],
	#category : 'Iceberg-Tests-Base',
	#package : 'Iceberg-Tests',
	#tag : 'Base'
}

{ #category : 'instance creation' }
IceTestParameter class >> withOptions: aCollection [ 
	^ self new options: (aCollection collect: #asTestParameterValue); yourself
]

{ #category : 'instance creation' }
IceTestParameter class >> withOptions: aCollection on: target selector: selector [
	^ self new 
		options: (aCollection collect: [:value | 
			IceTestParameterValue new 
				value: value;
				target: target;
				selector: selector]); 
		yourself
]

{ #category : 'accessing' }
IceTestParameter >> options [
	^ options
]

{ #category : 'accessing' }
IceTestParameter >> options: anObject [
	options := anObject
]

{ #category : 'printing' }
IceTestParameter >> printOn: aStream [
	aStream
		print: self class;
		nextPut: $(;
		nextPutAll: (', ' join: (self options collect: #shortName));
		nextPut: $).
]
