"
Command that opens a window showing the history of the selected merged branch.
"
Class {
	#name : 'IceTipMergeHistoryCommand',
	#superclass : 'IceTipRepositoryCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipMergeHistoryCommand class >> defaultDescription [

	^ 'Show the merged history of the selected merge commit'
]

{ #category : 'accessing - defaults' }
IceTipMergeHistoryCommand class >> defaultName [

	^ 'Browse merge history'
]

{ #category : 'testing' }
IceTipMergeHistoryCommand >> canBeExecuted [

	^ self commitModel hasMultipleAncestors
]

{ #category : 'executing' }
IceTipMergeHistoryCommand >> commitModel [

	^ self context selectedCommit
]

{ #category : 'executing' }
IceTipMergeHistoryCommand >> execute [

	(IceTipHistoryBrowser on:
		 self commitModel mergeHistoryFromSecondAncestor) open
]
