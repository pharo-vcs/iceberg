"
I'm the status bar for a IceTipWorkingCopyBrowser.
"
Class {
	#name : 'IceTipWorkingCopyStatusBarPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'branchLabel',
		'commitLink',
		'statusLabel'
	],
	#category : 'Iceberg-TipUI-View-WorkingCopy',
	#package : 'Iceberg-TipUI',
	#tag : 'View-WorkingCopy'
}

{ #category : 'layout' }
IceTipWorkingCopyStatusBarPresenter class >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		  add: #branchLabel expand: false;
		  add: #commitLink
			  expand: true
			  fill: true
			  padding: 0;
		  addLast: #statusLabel expand: false;
		  yourself
]

{ #category : 'testing' }
IceTipWorkingCopyStatusBarPresenter >> canTakeKeyboardFocus [

	^ false
]

{ #category : 'initialization' }
IceTipWorkingCopyStatusBarPresenter >> initializePresenters [

	branchLabel := self newLabel.
	statusLabel := self newLabel
]

{ #category : 'accessing' }
IceTipWorkingCopyStatusBarPresenter >> model: aModel [
	"Fill labels from a IceTipWorkingCopyModel."

	aModel shortCommitId
		ifNil: [ self refreshWithoutCommitId: aModel ]
		ifNotNil: [ self refreshWithCommitId: aModel ].
	statusLabel 
		label: aModel status;
		displayColor: [ :aString | aModel statusDecorator color ];
		displayBold: [ :aString | aModel statusDecorator isBold ].

]

{ #category : 'accessing' }
IceTipWorkingCopyStatusBarPresenter >> refreshWithCommitId: aModel [

	branchLabel label: ('{1} at ' format: { aModel branchName }).
	commitLink := self newLink.
	commitLink
		label: aModel shortCommitId;
		help: 'Copy the commit ID to the clipboard';
		action: [ aModel copyCommitIDToClipboard ].

]

{ #category : 'accessing' }
IceTipWorkingCopyStatusBarPresenter >> refreshWithoutCommitId: aModel [

	branchLabel label: aModel branchName.
	commitLink := self newNullPresenter.

]
