"
I represent a possible value of a test parameter.

I have the responsibility of knowing the desired value, but also how to make it accessible for the test.

Public API and Key Messages

- activate will make me available for running the test
- deactivate will restore any previous values before my activation.

Internal Representation and Key Implementation Points.
    Instance Variables
	value: <Object> The value of the parameter I represent.
	target:  <Object> An object to which we will hand this value.
	selector:	 <Symbol> A symbol which will be used to get/set the value in the target object.
	previousValue: <Object> Used to restore the state of the target object after running the test.


"
Class {
	#name : 'IceTestParameterValue',
	#superclass : 'Object',
	#instVars : [
		'value',
		'target',
		'selector',
		'previousValue'
	],
	#category : 'Iceberg-Tests-Base',
	#package : 'Iceberg-Tests',
	#tag : 'Base'
}

{ #category : 'activating' }
IceTestParameterValue >> activate [
	self previousValue: self getValue.
	self setValue: self value
]

{ #category : 'activating' }
IceTestParameterValue >> deactivate [
	self setValue: self previousValue
]

{ #category : 'activating' }
IceTestParameterValue >> getValue [
	^ self target perform: self selector
]

{ #category : 'accessing' }
IceTestParameterValue >> previousValue [
	^ previousValue
]

{ #category : 'accessing' }
IceTestParameterValue >> previousValue: anObject [
	previousValue := anObject
]

{ #category : 'printing' }
IceTestParameterValue >> printOn: aStream [
	aStream 
		print: self class; 
		nextPut: $(; 
		nextPutAll: self shortName; 
		nextPut: $)
]

{ #category : 'accessing' }
IceTestParameterValue >> selector [
	^ selector
]

{ #category : 'accessing' }
IceTestParameterValue >> selector: anObject [
	selector := anObject
]

{ #category : 'activating' }
IceTestParameterValue >> setValue: newValue [
	^ self target perform: self selector asMutator with: newValue
]

{ #category : 'printing' }
IceTestParameterValue >> shortName [
	^ (self value respondsTo: #shortName)
		ifTrue: [ self value shortName ]
		ifFalse: [ self value printString ]
]

{ #category : 'accessing' }
IceTestParameterValue >> target [
	^ target
]

{ #category : 'accessing' }
IceTestParameterValue >> target: anObject [
	target := anObject
]

{ #category : 'accessing' }
IceTestParameterValue >> value [
	^ value
]

{ #category : 'accessing' }
IceTestParameterValue >> value: anObject [
	value := anObject
]
