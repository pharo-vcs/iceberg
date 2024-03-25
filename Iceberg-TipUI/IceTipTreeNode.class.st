"
I'm a node of a tree.
I understand 
	- descriptionWithDecoration
	- icon
"
Class {
	#name : 'IceTipTreeNode',
	#superclass : 'Object',
	#instVars : [
		'model',
		'parent',
		'iconFormSet'
	],
	#category : 'Iceberg-TipUI-View-Repository',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Repository'
}

{ #category : 'instance creation' }
IceTipTreeNode class >> on: aModel [
	^ self new model: aModel
]

{ #category : 'testing' }
IceTipTreeNode >> canActivateCommand: aCommandClass [
	^ false
]

{ #category : 'accessing' }
IceTipTreeNode >> children [
	^ #()
]

{ #category : 'accessing' }
IceTipTreeNode >> description [

	^ self subclassResponsibility
]

{ #category : 'reflective operations' }
IceTipTreeNode >> doesNotUnderstand: aMessage [
	"redirect to model to provide polymorphism."
	self flag: #pharoTodo. "I'm not sure this is good practice... we'll see how it works"
	self model ifNil: [ ^ super doesNotUnderstand: aMessage ].
	^ aMessage sendTo: self model
]

{ #category : 'accessing' }
IceTipTreeNode >> icon [
	^ self iconFormSet ifNotNil: [ :formSet | formSet asForm ]
]

{ #category : 'accessing' }
IceTipTreeNode >> iconFormSet [
	^ iconFormSet
]

{ #category : 'accessing' }
IceTipTreeNode >> iconFormSet: aFormSet [
	iconFormSet := aFormSet
]

{ #category : 'testing' }
IceTipTreeNode >> isGroup [
	^ false
]

{ #category : 'testing' }
IceTipTreeNode >> isLeaf [
	^ self isGroup not
]

{ #category : 'testing' }
IceTipTreeNode >> isSameAs: aNode [
	^ self subclassResponsibility
]

{ #category : 'accessing' }
IceTipTreeNode >> model [
	^ model
]

{ #category : 'accessing' }
IceTipTreeNode >> model: anObject [
	model := anObject
]

{ #category : 'accessing' }
IceTipTreeNode >> parent [
	^ parent
]

{ #category : 'accessing' }
IceTipTreeNode >> parent: anObject [
	parent := anObject
]

{ #category : 'accessing' }
IceTipTreeNode >> path [
	^ self parent 
		ifNotNil: [ :p | p path, { self } ]
		ifNil: [ { self } ]
]

{ #category : 'accessing' }
IceTipTreeNode >> traversingDo: aBlock parents: anArray [
	self subclassResponsibility
]
