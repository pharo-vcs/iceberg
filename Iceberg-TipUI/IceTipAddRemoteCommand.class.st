"
Command that opens a dialog to add a remote to a repository.
"
Class {
	#name : #IceTipAddRemoteCommand,
	#superclass : #IceTipRemotesTreeCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipAddRemoteCommand class >> defaultDescription [

	^ 'Adds a remote to this repository'
]

{ #category : #accessing }
IceTipAddRemoteCommand class >> defaultName [

	^ 'Add remote'
]

{ #category : #execution }
IceTipAddRemoteCommand >> execute [

	(IceTipAddRemoteDialog on: self repositoryModel) openDialogWithSpec
]

{ #category : #accessing }
IceTipAddRemoteCommand >> iconName [

	^ #add
]

{ #category : #testing }
IceTipAddRemoteCommand >> shouldBeDisplayedOnRightSideInToolbar [

	^ true
]
