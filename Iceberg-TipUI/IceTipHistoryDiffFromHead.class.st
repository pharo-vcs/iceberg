"
I keep a diff from HEAD to WorkingCopy.

"
Class {
	#name : 'IceTipHistoryDiffFromHead',
	#superclass : 'IceTipHistoryDiffUpdater',
	#category : 'Iceberg-TipUI-View-Branch',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Branch'
}

{ #category : 'accessing' }
IceTipHistoryDiffFromHead >> diffFor: aCommitModel [
	^ aCommitModel diffFromHead
]

{ #category : 'accessing' }
IceTipHistoryDiffFromHead >> labelFor: aCommitModel [
	^ 'HEAD to {1}' format: { aCommitModel ifNotNil: #shortId }
]
