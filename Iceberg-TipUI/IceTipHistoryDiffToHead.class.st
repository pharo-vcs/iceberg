"
I keep a diff from WorkingCopy to HEAD.

"
Class {
	#name : 'IceTipHistoryDiffToHead',
	#superclass : 'IceTipHistoryDiffUpdater',
	#category : 'Iceberg-TipUI-View-Branch',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Branch'
}

{ #category : 'accessing' }
IceTipHistoryDiffToHead >> diffFor: aCommitModel [
	^ aCommitModel diffToHead
]

{ #category : 'accessing' }
IceTipHistoryDiffToHead >> labelFor: aCommitModel [
	^ '{1} to HEAD' format: { aCommitModel ifNotNil: #shortId }
]
