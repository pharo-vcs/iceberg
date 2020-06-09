"
I visit a tree of IceNode with IceOperationMerge with all operations already chosen and return the coresponding tree of changes (IceNodes with IceOperation)
"
Class {
	#name : #IceMergeToChangeTreeVisitor,
	#superclass : #IceTreeVisitor,
	#category : #'Iceberg-Changes'
}

{ #category : #'as yet unclassified' }
IceMergeToChangeTreeVisitor >> convertMergeNodeToChangeNode [
	currentNode value: currentNode value chosenOperation .
]

{ #category : #visiting }
IceMergeToChangeTreeVisitor >> visitAddition: anIceAddition [ 
	self convertMergeNodeToChangeNode.
]

{ #category : #visiting }
IceMergeToChangeTreeVisitor >> visitClassDefinition: anIceClassDefinition [ 
	self convertMergeNodeToChangeNode.
	self visitChildrenOf: currentNode
]

{ #category : #visting }
IceMergeToChangeTreeVisitor >> visitNoModification: anIceNoModification [
	anIceNoModification definition accept: self.
]

{ #category : #visting }
IceMergeToChangeTreeVisitor >> visitNonConflictingOperation: anIceNonConflictingOperation [ 
	anIceNonConflictingOperation chosenOperation accept: self.
]

{ #category : #visiting }
IceMergeToChangeTreeVisitor >> visitPackage: anIcePackageDefinition [
	self convertMergeNodeToChangeNode.
	self visitChildrenOf: currentNode
]

{ #category : #visting }
IceMergeToChangeTreeVisitor >> visitRootDefinition: anIceRootDefinition [ 
	self visitChildrenOf: currentNode
]
