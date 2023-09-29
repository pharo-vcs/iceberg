"
A generic command to expand tree items within a tree.
"
Class {
	#name : 'IceTipTreeExpandCommand',
	#superclass : 'IceTipCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipTreeExpandCommand class >> defaultDescription [

	^ 'Expand selected item'
]

{ #category : 'accessing - defaults' }
IceTipTreeExpandCommand class >> defaultName [

	^ 'Expand'
]

{ #category : 'testing' }
IceTipTreeExpandCommand >> canBeExecuted [

	^ self hasSelectedItem

]

{ #category : 'executing' }
IceTipTreeExpandCommand >> execute [

	self context doExpandSelection
]

{ #category : 'accessing' }
IceTipTreeExpandCommand >> iconName [

	^ nil
]
