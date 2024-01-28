"
I am a command implementing the inspect option. I have several context activations to be able to inspect different objects in Iceberg's UI
"
Class {
	#name : 'IceTipInspectCommand',
	#superclass : 'IceTipCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipInspectCommand class >> defaultDescription [

	^ 'Inspect the selected element'
]

{ #category : 'accessing - defaults' }
IceTipInspectCommand class >> defaultName [

	^ 'Inspect...'
]

{ #category : 'testing' }
IceTipInspectCommand >> canBeExecuted [

	^ self context hasSelectedItem
]

{ #category : 'executing' }
IceTipInspectCommand >> execute [

	self item inspect
]

{ #category : 'accessing' }
IceTipInspectCommand >> iconName [

	^ #glamorousInspect
]
