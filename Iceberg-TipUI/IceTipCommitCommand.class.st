"
I open a the commit window, with all latest changes.
"
Class {
	#name : #IceTipCommitCommand,
	#superclass : #IceTipRepositoryCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipCommitCommand class >> defaultDescription [

	^ 'Commit changes to this repository'
]

{ #category : #accessing }
IceTipCommitCommand class >> defaultName [

	^ 'Commit'
]

{ #category : #testing }
IceTipCommitCommand >> canBeExecuted [

	^ self isRepositoryOperational
]

{ #category : #execution }
IceTipCommitCommand >> execute [

	(IceTipCommitBrowser on: self repositoryModel) openWithSpec
]

{ #category : #accessing }
IceTipCommitCommand >> iconName [

	^ #smallOk
]

{ #category : #accessing }
IceTipCommitCommand >> shortcutKey [

	^ $s meta
]
