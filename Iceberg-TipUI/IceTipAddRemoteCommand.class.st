"
Command that opens a dialog to add a remote to a repository.
"
Class {
	#name : #IceTipAddRemoteCommand,
	#superclass : #IceTipRemotesTreeCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #'accessing - defaults' }
IceTipAddRemoteCommand class >> defaultDescription [

	^ 'Adds a remote to this repository'
]

{ #category : #'accessing - defaults' }
IceTipAddRemoteCommand class >> defaultName [

	^ 'Add remote'
]

{ #category : #executing }
IceTipAddRemoteCommand >> canBeExecuted [
	"Any repository can have more remotes."

	^ true
]

{ #category : #executing }
IceTipAddRemoteCommand >> execute [

	(IceTipAddRemoteDialog 
		newApplication: context application 
		model: self repositoryModel) 
		asModalWindow 
			centeredRelativeTo: context window;
			open
]

{ #category : #accessing }
IceTipAddRemoteCommand >> iconName [

	^ #add
]

{ #category : #testing }
IceTipAddRemoteCommand >> shouldBeDisplayedOnRightSideInToolbar [

	^ true
]
