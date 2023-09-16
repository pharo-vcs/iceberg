"
Attempting to merge arised a conflict so merge was aborted.
"
Class {
	#name : 'IceMergeAborted',
	#superclass : 'IceError',
	#category : 'Iceberg-Errors',
	#package : 'Iceberg',
	#tag : 'Errors'
}

{ #category : 'visiting' }
IceMergeAborted >> acceptError: aVisitor [
	aVisitor visitMergeAborted: self
]
