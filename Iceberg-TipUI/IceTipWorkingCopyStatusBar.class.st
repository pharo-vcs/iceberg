"
I'm the status bar for a IceTipWorkingCopyBrowser.
"
Class {
	#name : #IceTipWorkingCopyStatusBar,
	#superclass : #SpPresenter,
	#instVars : [
		'branchLabel',
		'commitLink',
		'statusLabel'
	],
	#category : #'Iceberg-TipUI-View-WorkingCopy'
}

{ #category : #specs }
IceTipWorkingCopyStatusBar class >> defaultSpec [

	^ SpBoxLayout newHorizontal
		  add: #branchLabel expand: false;
		  add: #commitLink
			  expand: true
			  fill: true
			  padding: 0;
		  addLast: #statusLabel expand: false;
		  yourself
]

{ #category : #testing }
IceTipWorkingCopyStatusBar >> canTakeKeyboardFocus [

	^ false
]

{ #category : #initialization }
IceTipWorkingCopyStatusBar >> initializePresenters [

	super initializePresenters.
	branchLabel := self newLabel.
	commitLink := self newLink.
	statusLabel := self newLabel
]

{ #category : #accessing }
IceTipWorkingCopyStatusBar >> model: aModel [
	"Fill labels from a IceTipWorkingCopyModel."

	aModel shortCommitId
		ifNil: [ self refreshWithoutCommitId: aModel ]
		ifNotNil: [ self refreshWithCommitId: aModel ].
	statusLabel label: aModel status.

]

{ #category : #accessing }
IceTipWorkingCopyStatusBar >> refreshWithCommitId: aModel [

	branchLabel label: ('{1} at ' format: { aModel branchName }).
	commitLink
		label: aModel shortCommitId;
		help: 'Copy the commit ID to the clipboard';
		action: [ aModel copyCommitIDToClipboard ].

]

{ #category : #accessing }
IceTipWorkingCopyStatusBar >> refreshWithoutCommitId: aModel [

	branchLabel label: aModel branchName.
	commitLink
		label: '';
		help: '';
		action: [ ]
]
