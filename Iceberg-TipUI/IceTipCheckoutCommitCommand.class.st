"
I checkout a specific commit from history.
I will let your repository in detach mode!
"
Class {
	#name : #IceTipCheckoutCommitCommand,
	#superclass : #IceTipCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #'accessing - defaults' }
IceTipCheckoutCommitCommand class >> defaultDescription [

	^ 'Set the selected commit as current commit and load the code in the image'
]

{ #category : #'accessing - defaults' }
IceTipCheckoutCommitCommand class >> defaultName [

	^ 'Checkout'
]

{ #category : #executing }
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
