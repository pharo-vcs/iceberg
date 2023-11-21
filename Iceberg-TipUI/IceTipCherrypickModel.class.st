Class {
	#name : 'IceTipCherrypickModel',
	#superclass : 'IceTipModel',
	#instVars : [
		'mergeTree',
		'commitish'
	],
	#category : 'Iceberg-TipUI-Model',
	#package : 'Iceberg-TipUI',
	#tag : 'Model'
}

{ #category : 'instance creation' }
IceTipCherrypickModel class >> onCommitish: aCommitish [

	^ self new
		  commitish: aCommitish;
		  yourself
]

{ #category : 'accessing' }
IceTipCherrypickModel >> commitish [
	^commitish
]

{ #category : 'accessing' }
IceTipCherrypickModel >> commitish: aCommistish [
	commitish := aCommistish.
	mergeTree := commitish repository cherryPickFrom: aCommistish
]

{ #category : 'accessing' }
IceTipCherrypickModel >> diff [
	^ self
]

{ #category : 'accessing' }
IceTipCherrypickModel >> mergeTree [
	^mergeTree
]

{ #category : 'accessing' }
IceTipCherrypickModel >> repository [
	^commitish repository.
]

{ #category : 'accessing' }
IceTipCherrypickModel >> treeToShow [
" Return the tree to display in windows "
	^ self mergeTree
]
