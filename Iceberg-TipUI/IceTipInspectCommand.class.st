"
I am a command implementing the inspect option. I have several context activations to be able to inspect different objects in Iceberg's UI
"
Class {
	#name : #IceTipInspectCommand,
	#superclass : #IceTipCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #'accessing - defaults' }
IceTipInspectCommand class >> defaultDescription [

	^ 'Inspect the selected element'
]

{ #category : #'accessing - defaults' }
IceTipInspectCommand class >> defaultName [

	^ 'Inspect...'
]

{ #category : #executing }
IceTipInspectCommand >> canBeExecuted [

	^ self context hasSelectedItem
]

{ #category : #executing }
IceTipInspectCommand >> execute [

	self item inspect
]

{ #category : #accessing }
IceTipInspectCommand >> iconName [

	^ #glamorousInspect
]

{ #category : #accessing }
IceTipInspectCommand >> item [

	| maybeCachedObject |
	maybeCachedObject := super item.
	
	^ (maybeCachedObject respondsTo: #realObject)
		ifTrue: [ maybeCachedObject realObject ] ifFalse: [ maybeCachedObject ]
]
