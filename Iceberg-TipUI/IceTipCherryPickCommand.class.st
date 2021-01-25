Class {
	#name : #IceTipCherryPickCommand,
	#superclass : #IceTipCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #default }
IceTipCherryPickCommand class >> defaultDescription [

	^ 'Cherrypick this commit and apply changes to the working copy'
]

{ #category : #default }
IceTipCherryPickCommand class >> defaultName [

	^ 'Cherrypick'
]

{ #category : #testing }
IceTipCherryPickCommand >> canBeExecuted [

	self flag: #pharoTodo. "TODO: Still not ready"
	^ false
]

{ #category : #execution }
IceTipCherryPickCommand >> execute [

	(IceTipCherrypickPreviewBrowser onCommitish: self selectedCommitish)
		openWithSpec
]

{ #category : #execution }
IceTipCherryPickCommand >> selectedCommitish [

	^ self context selectedCommit realObject entity
]
