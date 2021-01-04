"
I checkout a specific commit from history.
I will let your repository in detach mode!
"
Class {
	#name : #IceTipCheckoutCommitCommand,
	#superclass : #IceTipCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipCheckoutCommitCommand class >> defaultDescription [

	^ 'Set the selected commit as current commit and load the code in the image'
]

{ #category : #activation }
IceTipCheckoutCommitCommand class >> defaultName [

	^ 'Checkout'
]

{ #category : #execution }
IceTipCheckoutCommitCommand >> execute [

	(IceTipCheckoutPreviewBrowser onBranch: self selectedCommit)
		openWithSpec
]

{ #category : #accessing }
IceTipCheckoutCommitCommand >> iconName [

	^ #refresh
]

{ #category : #accessing }
IceTipCheckoutCommitCommand >> selectedCommit [

	^ self context selectedCommit
]
