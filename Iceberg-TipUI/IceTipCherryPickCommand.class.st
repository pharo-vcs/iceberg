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

{ #category : #execution }
IceTipCherryPickCommand >> execute [

	(IceTipCherrypickPreviewBrowser onCommitish: self selectedCommitish)
		openWithSpec
]

{ #category : #execution }
IceTipCherryPickCommand >> selectedCommitish [

	^ self context selectedCommit realObject entity
]
