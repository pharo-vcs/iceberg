Class {
	#name : #IceTipCherryPickCommand,
	#superclass : #IceTipCommand2,
	#category : #'Iceberg-TipUI-Commands'
}

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
