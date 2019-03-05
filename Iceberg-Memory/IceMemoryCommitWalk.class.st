Class {
	#name : #IceMemoryCommitWalk,
	#superclass : #IceAbstractCommitWalk,
	#instVars : [
		'startingPoint',
		'queue'
	],
	#category : 'Iceberg-Memory'
}

{ #category : #walking }
IceMemoryCommitWalk >> commitsDo: aBlock [ 
	self rawResultsDo: aBlock
]

{ #category : #'instance creation' }
IceMemoryCommitWalk >> fromBranch: aBranch [
	
	self fromCommit: aBranch commit
]

{ #category : #'instance creation' }
IceMemoryCommitWalk >> fromCommit: anIceMemoryCommit [ 
	
	queue add: anIceMemoryCommit
]

{ #category : #'instance creation' }
IceMemoryCommitWalk >> fromTag: anIceTag [ 
	self shouldBeImplemented.
]

{ #category : #initialization }
IceMemoryCommitWalk >> initialize [

	super initialize.
	queue := OrderedCollection new
]

{ #category : #iterating }
IceMemoryCommitWalk >> rawResultsDo: aBlockClosure [ 
	
	| current |
	[ queue notEmpty ] whileTrue: [
		current := queue removeFirst.
		queue addAllLast: current ancestors.
		aBlockClosure value: current.
	]
]
