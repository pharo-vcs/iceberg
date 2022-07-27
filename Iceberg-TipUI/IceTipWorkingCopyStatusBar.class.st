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

{ #category : #layout }
IceTipWorkingCopyStatusBar class >> defaultLayout [

	^ SpBoxLayout newLeftToRight
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
	statusLabel := self newLabel
]

{ #category : #accessing }
IceTipWorkingCopyStatusBar >> model: aModel [
	"Fill labels from a IceTipWorkingCopyModel."

	aModel shortCommitId
		ifNil: [ self refreshWithoutCommitId: aModel ]
		ifNotNil: [ self refreshWithCommitId: aModel ].
	statusLabel 
		label: aModel statusString;
		displayColor: [ :aString | aModel statusDecorator color ];
		displayBold: [ :aString | aModel statusDecorator isBold ].

]

{ #category : #accessing }
IceTipWorkingCopyStatusBar >> refreshWithCommitId: aModel [

	branchLabel label: ('{1} at ' format: { aModel branchName }).
	commitLink := self newLink.
	commitLink
		label: aModel shortCommitId;
		help: 'Copy the commit ID to the clipboard';
		action: [ aModel copyCommitIDToClipboard ].

]

{ #category : #accessing }
IceTipWorkingCopyStatusBar >> refreshWithoutCommitId: aModel [

	branchLabel label: aModel branchName.
	commitLink := self newNullPresenter.

]
