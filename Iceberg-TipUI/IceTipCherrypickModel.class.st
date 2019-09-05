Class {
	#name : #IceTipCherrypickModel,
	#superclass : #IceTipModel,
	#instVars : [
		'mergeTree',
		'source',
		'target'
	],
	#category : #'Iceberg-TipUI-Model'
}

{ #category : #'as yet unclassified' }
IceTipCherrypickModel class >> onCommitish: aCommitish [
	^ (self new
		commitish: aCommitish;
		yourself)
]

{ #category : #accessing }
IceTipCherrypickModel >> commitish [
	^source
]

{ #category : #accessing }
IceTipCherrypickModel >> commitish: aCommistish [
	self from: aCommistish to: aCommistish repository head
]

{ #category : #accessing }
IceTipCherrypickModel >> diff [
	^ self
]

{ #category : #accessing }
IceTipCherrypickModel >> from: sourceCommitish to: targetCommitish [
	source := sourceCommitish.
	target := targetCommitish.
	mergeTree := targetCommitish cherryPickFrom: sourceCommitish.
]

{ #category : #accessing }
IceTipCherrypickModel >> mergeTree [
	^mergeTree
]

{ #category : #accessing }
IceTipCherrypickModel >> repository [
	^source repository.
]

{ #category : #accessing }
IceTipCherrypickModel >> treeToShow [
" Return the tree to display in windows "
	^ self mergeTree
]
