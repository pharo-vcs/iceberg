"
Generic command to cherry pick changes
"
Class {
	#name : #IceTipCherryPickCommand,
	#superclass : #IceTipCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #'accessing - defaults' }
IceTipCherryPickCommand class >> defaultDescription [

	^ 'Cherrypick this commit and apply changes to the working copy'
]

{ #category : #'accessing - defaults' }
IceTipCherryPickCommand class >> defaultName [

	^ 'Cherrypick'
]

{ #category : #testing }
IceTipCherryPickCommand >> canBeExecuted [

	self flag: #pharoTodo. "TODO: Still not ready"
	^ false
]

{ #category : #executing }
IceTipCherryPickCommand >> execute [

	(IceTipCherrypickPreviewBrowser onCommitish: self selectedCommitish)
		openWithSpec
]

{ #category : #executing }
IceTipCherryPickCommand >> selectedCommitish [

	^ self context selectedCommit realObject entity
]
