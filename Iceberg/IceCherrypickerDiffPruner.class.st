"
I am an IceDiff visitor to remove nodes that are not required the IceCherrypicker dependencies.

"
Class {
	#name : #IceCherrypickerDiffPruner,
	#superclass : #IceTreeVisitor,
	#instVars : [
		'cherrypicker',
		'nodesToRemove'
	],
	#category : #'Iceberg-Cherrypicking'
}

{ #category : #applying }
IceCherrypickerDiffPruner >> applyTo: anIceDiff [
	
	nodesToRemove := Set new.
	
	anIceDiff accept: self.
	
	nodesToRemove do: [ :aNode | aNode parent removeChild: aNode ].

]

{ #category : #accessing }
IceCherrypickerDiffPruner >> cherrypicker [
	^ cherrypicker
]

{ #category : #accessing }
IceCherrypickerDiffPruner >> cherrypicker: anIceCherrypicker [
	cherrypicker := anIceCherrypicker
]

{ #category : #visiting }
IceCherrypickerDiffPruner >> visitAddition: anIceAddition [ 
	
	(cherrypicker includesDependencyTo: anIceAddition definition) 
		ifFalse: [ nodesToRemove add: currentNode ]
]

{ #category : #visiting }
IceCherrypickerDiffPruner >> visitModification: anIceModification [

	(cherrypicker includesDependencyTo: anIceModification definition)
		ifFalse: [ nodesToRemove add: currentNode ]
]

{ #category : #visiting }
IceCherrypickerDiffPruner >> visitNoModification: anIceNoModification [ 
	
	"Nothing with me. Just visit children"
	self visitChildrenOf: currentNode.

]

{ #category : #visiting }
IceCherrypickerDiffPruner >> visitRemoval: anIceRemoval [
	(cherrypicker includesDependencyTo: anIceRemoval definition)
		ifFalse: [ nodesToRemove add: currentNode ]
]
