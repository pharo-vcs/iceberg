"
I am a IceNode (and IceDefinition) visitor that can detect a code entity in the tree.
"
Class {
	#name : #IceNodeQuery,
	#superclass : #IceTreeVisitor,
	#instVars : [
		'root',
		'results',
		'selector',
		'entityName'
	],
	#category : #'Iceberg-Cherrypicking'
}

{ #category : #building }
IceNodeQuery >> className: aString [ 
	
	entityName := aString
]

{ #category : #executing }
IceNodeQuery >> execute [
	
	root accept: self
]

{ #category : #querying }
IceNodeQuery >> ifFound: aBlockClosure [ 

	results do: aBlockClosure 
]

{ #category : #visiting }
IceNodeQuery >> initialize [

	super initialize.
	results := Set new
]

{ #category : #building }
IceNodeQuery >> on: anIceNode [ 
	
	root := anIceNode
]

{ #category : #building }
IceNodeQuery >> packageName: aString [
	entityName := aString
]

{ #category : #building }
IceNodeQuery >> selector: aSelector [ 
	
	selector := aSelector
]

{ #category : #building }
IceNodeQuery >> traitName: aString [ 
	
	entityName := aString
]

{ #category : #visiting }
IceNodeQuery >> visitAddition: anIceAddition [ 
	
	anIceAddition definition accept: self.
	self visitChildrenOf: currentNode.
]

{ #category : #visiting }
IceNodeQuery >> visitClassDefinition: anIceClassDefinition [ 
	
	anIceClassDefinition asMCDefinition className = entityName ifTrue: [ results add: currentNode ].
]

{ #category : #visiting }
IceNodeQuery >> visitExtensionDefinition: anIceExtensionDefinition [
	anIceExtensionDefinition name = entityName
		ifTrue: [ results add: currentNode ].
]

{ #category : #visiting }
IceNodeQuery >> visitMethodNode: anIceMethodDefinition [ 

	anIceMethodDefinition asMCDefinition selector = selector ifTrue: [ results add: currentNode ].
]

{ #category : #visiting }
IceNodeQuery >> visitModification: anIceModification [ 

	anIceModification definition accept: self.
	self visitChildrenOf: currentNode.
]

{ #category : #visiting }
IceNodeQuery >> visitNoModification: anIceNoModification [

	"Nothing with me. Just visit children"
	self visitChildrenOf: currentNode
]

{ #category : #visiting }
IceNodeQuery >> visitPackage: anIcePackageDefinition [
	anIcePackageDefinition name = entityName
		ifTrue: [ results add: currentNode ]
]

{ #category : #visiting }
IceNodeQuery >> visitRemoval: anIceRemoval [
	anIceRemoval definition accept: self.
	self visitChildrenOf: currentNode
]

{ #category : #visiting }
IceNodeQuery >> visitTraitDefinition: anIceTraitDefinition [ 
	
	anIceTraitDefinition asMCDefinition className = entityName ifTrue: [ results add: currentNode ].
]
