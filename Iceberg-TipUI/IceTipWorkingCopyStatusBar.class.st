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
	#category : #'Iceberg-TipUI-View'
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

	branchLabel := self newLabel.
	commitLink := self newLink.
	statusLabel := self newLabel
]

{ #category : #accessing }
IceTipWorkingCopyStatusBar >> model: aModel [
	"Fill labels from a IceTipWorkingCopyModel."

	branchLabel label: ('{1} at ' format: { aModel branchName }).
	commitLink
		label: aModel shortCommitId;
		help: 'Copy the commit ID to the clipboard';
		action: [ aModel copyCommitIDToClipboard ].
	statusLabel label: aModel status
]
