"
I'm a context for the history browser (IceHistoryBrowser)
"
Class {
	#name : #IceTipHistoryContext,
	#superclass : #IceTipContext,
	#instVars : [
		'item',
		'selectedBranch'
	],
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipHistoryContext >> item [
	^ item
]

{ #category : #accessing }
IceTipHistoryContext >> item: anObject [
	item := anObject
]

{ #category : #accessing }
IceTipHistoryContext >> readContextParametersFromModel: aModel [
	super readContextParametersFromModel: aModel.
	"This model should be always an IceTipBranchModel"
	selectedBranch := aModel.
]

{ #category : #accessing }
IceTipHistoryContext >> selectedBranch [
	^ selectedBranch
]

{ #category : #accessing }
IceTipHistoryContext >> selectedCommit [
	^ self item
]
