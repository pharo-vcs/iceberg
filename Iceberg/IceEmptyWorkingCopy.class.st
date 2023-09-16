"
I am an empty working copy, with no loaded packages.
"
Class {
	#name : 'IceEmptyWorkingCopy',
	#superclass : 'IceWorkingCopyState',
	#category : 'Iceberg-WorkingCopy',
	#package : 'Iceberg',
	#tag : 'WorkingCopy'
}

{ #category : 'display' }
IceEmptyWorkingCopy >> description [
	
	^ 'Nothing loaded'
]

{ #category : 'testing' }
IceEmptyWorkingCopy >> isDetached [
	"I have no reference commit, I cannot be detached"
	^ false
]

{ #category : 'accessing' }
IceEmptyWorkingCopy >> referenceCommit [
	
	^ repository head commit
]

{ #category : 'validating' }
IceEmptyWorkingCopy >> validateCanCommit [
	
	"I've no packages loaded. I can always commit.
	I will commit on top of head."
]
