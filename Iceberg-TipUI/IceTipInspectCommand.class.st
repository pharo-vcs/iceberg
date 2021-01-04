"
I am a command implementing the inspect option. I have several context activations to be able to inspect different objects in Iceberg's UI
"
Class {
	#name : #IceTipInspectCommand,
	#superclass : #IceTipCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipInspectCommand class >> defaultDescription [

	^ 'Inspect the selected element'
]

{ #category : #accessing }
IceTipInspectCommand class >> defaultName [

	^ 'Inspect...'
]

{ #category : #execution }
IceTipInspectCommand >> canBeExecuted [

	^ self context hasSelectedItem
]

{ #category : #execution }
IceTipInspectCommand >> execute [

	self item inspect
]

{ #category : #accessing }
IceTipInspectCommand >> iconName [

	^ #glamorousInspect
]
