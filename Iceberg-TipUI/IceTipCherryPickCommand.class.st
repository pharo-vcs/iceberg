Class {
	#name : #IceTipCherrypickCommand,
	#superclass : #CmCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #hooks }
IceTipCherrypickCommand >> execute [
	"Execute the actions that should be done by the command.
	 This method expect that the context has been put in #context inst. var. if any context is relevant."

	(IceTipCherrypickPreviewBrowser
		onCommitish: context selectedCommit realObject entity) openWithSpec
]

{ #category : #hooks }
IceTipCherrypickCommand >> initialize [
    super initialize.
    self
        basicName: 'Cherrypick';
        basicDescription: 'Cherrypick this commit and apply changes to the working copy'
]
