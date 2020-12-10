Class {
	#name : #IceTipCherryPickCommand,
	#superclass : #IceTipCommand2,
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

{ #category : #hooks }
IceTipCherryPickCommand >> execute [

	(IceTipCherrypickPreviewBrowser onCommitish:
		 context selectedCommit realObject entity) openWithSpec
]

{ #category : #hooks }
IceTipCherryPickCommand >> initialize [

	super initialize.
	self
		name: 'Cherrypick';
		description:
			'Cherrypick this commit and apply changes to the working copy'
]
