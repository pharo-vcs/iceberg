"
Command that opens a window showing the history of the selected merged branch.
"
Class {
	#name : #IceTipMergeHistoryCommand,
	#superclass : #IceTipRepositoryCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipMergeHistoryCommand class >> defaultDescription [

	^ 'Show the merged history of the selected merge commit'
]

{ #category : #activation }
IceTipMergeHistoryCommand class >> defaultName [

	^ 'Browse merge history'
]

{ #category : #testing }
IceTipMergeHistoryCommand >> canBeExecuted [

	^ self commitModel hasMultipleAncestors
]

{ #category : #execution }
IceTipMergeHistoryCommand >> commitModel [

	^ self context selectedCommit
]

{ #category : #execution }
IceTipMergeHistoryCommand >> execute [

	(IceTipHistoryBrowser on:
		 self commitModel mergeHistoryFromSecondAncestor) openWithSpec
]
