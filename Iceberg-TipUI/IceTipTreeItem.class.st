"
I'm a leaf element of a tree.
"
Class {
	#name : #IceTipTreeItem,
	#superclass : #IceTipTreeNode,
	#category : #'Iceberg-TipUI-View-Repository'
}

{ #category : #testing }
IceTipTreeItem >> isSameAs: aNode [
	^ aNode species = self species 
		and: [ self model = aNode model ]
]

{ #category : #accessing }
IceTipTreeItem >> traversingDo: aBlock parents: anArray [
	aBlock cull: self cull: anArray
]
