Class {
	#name : #IceTipCherryPickCommand,
	#superclass : #CmCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #hooks }
IceTipCherryPickCommand >> execute [
	"Execute the actions that should be done by the command.
	 This method expect that the context has been put in #context inst. var. if any context is relevant."

(	IceTipCherrypickPreviewBrowser
		onCommitish: context selectedCommit realObject entity) openWithSpec.
]

{ #category : #hooks }
IceTipCherryPickCommand >> initialize [
	super initialize.
	self
		name: 'Cherrypick';
		description: 'Cherrypick this commit and apply changes to the working copy'
]
