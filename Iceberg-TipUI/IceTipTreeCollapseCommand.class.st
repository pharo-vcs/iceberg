"
A generic command to collapse a tree.
It sends `doCollapseSelection` message to its context.
"
Class {
	#name : 'IceTipTreeCollapseCommand',
	#superclass : 'IceTipCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipTreeCollapseCommand class >> defaultDescription [

	^ 'Collapse selected item'
]

{ #category : 'accessing - defaults' }
IceTipTreeCollapseCommand class >> defaultName [

	^ 'Collapse'
]

{ #category : 'testing' }
IceTipTreeCollapseCommand >> canBeExecuted [

	^ self hasSelectedItem

]

{ #category : 'executing' }
IceTipTreeCollapseCommand >> execute [

	self context doCollapseSelection
]
