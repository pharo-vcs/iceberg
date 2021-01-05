"
Command that copies the selected entity short commit ID to the clipboard
"
Class {
	#name : #IceTipCopyCommitishCommand,
	#superclass : #IceTipCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipCopyCommitishCommand class >> defaultDescription [

	^ 'Copy the selected short commit ID (7 characters long) to the clipboard'
]

{ #category : #accessing }
IceTipCopyCommitishCommand class >> defaultName [

	^ 'Copy commitish ID'
]

{ #category : #testing }
IceTipCopyCommitishCommand >> canBeExecuted [

	^ self hasSelectedItem and: [ self item commitId isNotNil ]
]

{ #category : #execution }
IceTipCopyCommitishCommand >> execute [

	self item copyCommitIDToClipboard
]

{ #category : #accessing }
IceTipCopyCommitishCommand >> iconName [

	^ #book
]
