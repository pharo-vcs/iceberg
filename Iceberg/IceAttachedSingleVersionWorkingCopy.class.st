"
I am a working copy whose packages were all loaded from the same single commit.
"
Class {
	#name : 'IceAttachedSingleVersionWorkingCopy',
	#superclass : 'IceWorkingCopyState',
	#category : 'Iceberg-WorkingCopy',
	#package : 'Iceberg',
	#tag : 'WorkingCopy'
}

{ #category : 'instance creation' }
IceAttachedSingleVersionWorkingCopy class >> on: anIceCommit repository: aRepository [
	
	^ self new
		referenceCommit: anIceCommit;
		repository: aRepository;
		yourself
]

{ #category : 'displaying' }
IceAttachedSingleVersionWorkingCopy >> description [
	
	^ self referenceCommit description
]

{ #category : 'testing' }
IceAttachedSingleVersionWorkingCopy >> includesCommit: anIceCommit [
	
	^ self referenceCommit = anIceCommit
]

{ #category : 'testing' }
IceAttachedSingleVersionWorkingCopy >> isCommitMerged: aCommit [

	^ aCommit isAncestorOf: self referenceCommit
]

{ #category : 'testing' }
IceAttachedSingleVersionWorkingCopy >> isDetached [
	
	^ self referenceCommit ~= repository head commit
]

{ #category : 'testing' }
IceAttachedSingleVersionWorkingCopy >> isSingleCommitState [
	
	^ true
]

{ #category : 'merging' }
IceAttachedSingleVersionWorkingCopy >> mergeCommit: mergeCommit [
	
	^ IceMerge new
		repository: self repository;
		mergeCommit: mergeCommit;
		execute.
]

{ #category : 'accessing' }
IceAttachedSingleVersionWorkingCopy >> singleCommit [
	
	^ self referenceCommit
]

{ #category : 'validating' }
IceAttachedSingleVersionWorkingCopy >> validateCanCommit [
	
	self isDetached
		ifTrue: [ IceWorkingCopyDesyncronized signal ]
]
