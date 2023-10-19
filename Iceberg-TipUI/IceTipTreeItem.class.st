"
I'm a leaf element of a tree.
"
Class {
	#name : 'IceTipTreeItem',
	#superclass : 'IceTipTreeNode',
	#category : 'Iceberg-TipUI-View-Repository',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Repository'
}

{ #category : 'accessing' }
IceTipTreeItem >> description [

	^ self model description
]

{ #category : 'accessing' }
IceTipTreeItem >> descriptionDecorator [

	^ self model descriptionDecorator
]

{ #category : 'testing' }
IceTipTreeItem >> isSameAs: aNode [
	^ aNode species = self species 
		and: [ self model = aNode model ]
]

{ #category : 'accessing' }
IceTipTreeItem >> shortDescription [

	^ self model shortDescription
]

{ #category : 'accessing' }
IceTipTreeItem >> traversingDo: aBlock parents: anArray [

	aBlock cull: self cull: anArray
]
