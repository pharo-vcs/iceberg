"
I implement a basic tree visitor for Iceberg trees implemented through IceNode
"
Class {
	#name : #IceTreeVisitor,
	#superclass : #Object,
	#instVars : [
		'currentNode'
	],
	#category : #'Iceberg-Changes'
}

{ #category : #testing }
IceTreeVisitor class >> isAbstract [

	^ self == IceTreeVisitor 
]

{ #category : #visiting }
IceTreeVisitor >> visitChildrenOf: anIceNode [ 
	
	anIceNode childrenDo: [ :each | each accept: self ]
]

{ #category : #visiting }
IceTreeVisitor >> visitConflictingOperation: anIceConflictingOperation [ 
	
	anIceConflictingOperation isResolved
		ifFalse: [ self error: 'Cannot apply a non resolved conflict' ].
		
	^ anIceConflictingOperation chosenOperation accept: self
]

{ #category : #visiting }
IceTreeVisitor >> visitEmptyNode: anIceEmptyNode [ 
	
	"Do nothing by default"
]

{ #category : #visiting }
IceTreeVisitor >> visitTreeNode: anIceNode [
	
	self withNode: anIceNode do: [ 
		anIceNode value accept: self ]
]

{ #category : #visiting }
IceTreeVisitor >> withNode: anIceNode do: aBlockClosure [ 
	
	| previousNode |
	previousNode := currentNode.
	currentNode := anIceNode.
	aBlockClosure ensure: [ 
		currentNode := previousNode ]
]
