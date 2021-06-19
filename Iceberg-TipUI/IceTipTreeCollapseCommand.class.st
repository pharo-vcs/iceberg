"
A generic command to collapse a tree.
It sends `doCollapseSelection` message to its context.
"
Class {
	#name : #IceTipTreeCollapseCommand,
	#superclass : #IceTipCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #'accessing - defaults' }
IceTipTreeCollapseCommand class >> defaultDescription [

	^ 'Collapse selected item'
]

{ #category : #'accessing - defaults' }
IceTipTreeCollapseCommand class >> defaultName [

	^ 'Collapse'
]

{ #category : #executing }
IceTipTreeCollapseCommand >> canBeExecuted [

	^ self hasSelectedItem

]

{ #category : #executing }
IceTipTreeCollapseCommand >> execute [

	self context doCollapseSelection
]

{ #category : #accessing }
IceTipTreeCollapseCommand >> shortcutKey [

	^ Character arrowLeft asKeyCombination
]
