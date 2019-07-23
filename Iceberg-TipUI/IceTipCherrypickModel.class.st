Class {
	#name : #IceTipCherrypickModel,
	#superclass : #IceTipModel,
	#instVars : [
		'mergeTree'
	],
	#category : #'Iceberg-TipUI-Model'
}

{ #category : #accessing }
IceTipCherrypickModel >> diff [

]

{ #category : #accessing }
IceTipCherrypickModel >> mergeTree [
	^mergeTree
]

{ #category : #accessing }
IceTipCherrypickModel >> mergeTree: aMergeTree [
	mergeTree := aMergeTree 
]

{ #category : #accessing }
IceTipCherrypickModel >> treeToShow [
" Return the tree to display in windows "
	^ self mergeTree
]
