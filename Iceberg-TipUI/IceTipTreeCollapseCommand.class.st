"
A generic command to collapse a tree.
It sends `doCollapseSelection` message to its context.
"
Class {
	#name : #IceTipTreeCollapseCommand,
	#superclass : #IceTipCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipTreeCollapseCommand class >> defaultDescription [

	^ 'Collapse selected item'
]

{ #category : #accessing }
IceTipTreeCollapseCommand class >> defaultName [

	^ 'Collapse'
]

{ #category : #execution }
IceTipTreeCollapseCommand >> canBeExecuted [

	^ self hasSelectedItem

]

{ #category : #execution }
IceTipTreeCollapseCommand >> execute [

	self context doCollapseSelection
]

{ #category : #accessing }
IceTipTreeCollapseCommand >> shortcutKey [

	^ Character arrowLeft asKeyCombination
]
