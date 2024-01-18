"
I represent an abstract change.
"
Class {
	#name : 'IceChange',
	#superclass : 'Object',
	#category : 'Iceberg-Changes',
	#package : 'Iceberg',
	#tag : 'Changes'
}

{ #category : 'displaying' }
IceChange >> accept: anIceChangeImporter [
	^ self subclassResponsibility
]

{ #category : 'displaying' }
IceChange >> displayingProgressString [
	^ self subclassResponsibility
]
