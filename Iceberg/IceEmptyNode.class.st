"
I am a null object representing an empty node of a tree. I'm used together with IceNode.
"
Class {
	#name : #IceEmptyNode,
	#superclass : #IceAbstractNode,
	#category : #'Iceberg-Changes'
}

{ #category : #visiting }
IceEmptyNode >> accept: aVisitor [
	
	^ aVisitor visitEmptyNode: self
]

{ #category : #adding }
IceEmptyNode >> addTo: anotherNode [ 
	"I'm empty, so I do not add myself to a tree."
]

{ #category : #enumerating }
IceEmptyNode >> anySatisfy: aBlockClosure [ 
	
	^ false
]

{ #category : #accessing }
IceEmptyNode >> children [
	
	^ #()
]

{ #category : #enumerating }
IceEmptyNode >> collect: aBlockClosure [ 

	^ self
]

{ #category : #enumerating }
IceEmptyNode >> collectWithPath: aBlockClosure [ 
	^ self
]

{ #category : #enumerating }
IceEmptyNode >> do: aBlock [
	"Do nothing"
]

{ #category : #enumerating }
IceEmptyNode >> firstNodeSuchThat: conditionBlock ifNone: noneBlock [
	
	^ (conditionBlock value: self)
		ifTrue: [ self ]
		ifFalse: noneBlock
]

{ #category : #testing }
IceEmptyNode >> hasChanges [
	
	^ false
]

{ #category : #accessing }
IceEmptyNode >> includesKey: aString [ 
	
	^ false
]

{ #category : #testing }
IceEmptyNode >> isEmpty [
	
	^ true
]

{ #category : #testing }
IceEmptyNode >> isEmptyNode [
	
	^ true
]

{ #category : #merging }
IceEmptyNode >> mergeWith: anotherNode onLeft: leftBlock onRight: rightBlock onMerge: mergeBlock [
	
	^ anotherNode collect: rightBlock
]

{ #category : #accessing }
IceEmptyNode >> path [

	^ RelativePath new
]

{ #category : #accessing }
IceEmptyNode >> resolve: aRelativePath ifPresent: presentBlock ifAbsent: absentBlock [ 
	^ absentBlock value
]

{ #category : #enumerating }
IceEmptyNode >> select: aBlockClosure [ 
	
	^ self
]
