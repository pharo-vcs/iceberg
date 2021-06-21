Class {
	#name : #IceNullCommitWalk,
	#superclass : #Object,
	#category : #'Iceberg-Core'
}

{ #category : #accessing }
IceNullCommitWalk >> commits [
	"A null commit walk has no commits"
	^ #()
]

{ #category : #accessing }
IceNullCommitWalk >> commitsDo: aBlock [ 
	"Do nothing. A null commit does not has any commits to walk."
]
