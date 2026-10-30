Class {
	#name : 'IceMemoryCommitWalk',
	#superclass : 'IceAbstractCommitWalk',
	#instVars : [
		'queue',
		'hiddenCommits'
	],
	#category : 'Iceberg-Memory',
	#package : 'Iceberg-Memory'
}

{ #category : 'initialize-release' }
IceMemoryCommitWalk >> close [
	"Nothing to do in memory"

	
]

{ #category : 'walking' }
IceMemoryCommitWalk >> commitsDo: aBlock [ 
	self rawResultsDo: aBlock
]

{ #category : 'instance creation' }
IceMemoryCommitWalk >> fromBranch: aBranch [
	
	self fromCommit: aBranch commit
]

{ #category : 'instance creation' }
IceMemoryCommitWalk >> fromCommit: anIceMemoryCommit [ 
	
	queue add: anIceMemoryCommit
]

{ #category : 'instance creation' }
IceMemoryCommitWalk >> fromTag: anIceTag [ 
	self shouldBeImplemented.
]

{ #category : 'walk definition' }
IceMemoryCommitWalk >> initialize [

	super initialize.
	queue := OrderedCollection new.
	hiddenCommits := OrderedCollection new
]

{ #category : 'walk definition' }
IceMemoryCommitWalk >> rawResultsDo: aBlockClosure [

	| current |
	[ queue notEmpty ] whileTrue: [
			current := queue removeFirst.
			(hiddenCommits includes: current) ifFalse: [
					queue addAllLast: current ancestors.
					aBlockClosure value: current ] ]
]

{ #category : 'walk definition' }
IceMemoryCommitWalk >> uptoCommit: aCommit [
	"Stop at aCommit and at everything reachable from it"

	| pending |
	pending := OrderedCollection with: aCommit.
	[ pending notEmpty ] whileTrue: [
			| current |
			current := pending removeFirst.
			(hiddenCommits includes: current) ifFalse: [
					hiddenCommits add: current.
					pending addAll: current ancestors ] ]
]
