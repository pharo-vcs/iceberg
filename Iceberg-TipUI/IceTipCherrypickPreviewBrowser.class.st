Class {
	#name : 'IceTipCherrypickPreviewBrowser',
	#superclass : 'IceTipBrowser',
	#instVars : [
		'diffPanel',
		'buttonBar'
	],
	#category : 'Iceberg-TipUI-View-Branch',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Branch'
}

{ #category : 'commands' }
IceTipCherrypickPreviewBrowser class >> buildGeneralCommandGroupWith: presenter for: aCommandGroup [

	"Nothing to add"
]

{ #category : 'commands' }
IceTipCherrypickPreviewBrowser class >> buildSelectionCommandGroupWith: presenter for: aCommandGroup [

	"Nothing to add"
]

{ #category : 'instance creation' }
IceTipCherrypickPreviewBrowser class >> onCommitish: aCommitish [
	^ self
		on:
			(IceTipCherrypickModel onCommitish: aCommitish)
]

{ #category : 'accessing - ui' }
IceTipCherrypickPreviewBrowser >> buttonBar [

	^ buttonBar
]

{ #category : 'layout' }
IceTipCherrypickPreviewBrowser >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: diffPanel;
		  add: buttonBar expand: false;
		  yourself
]

{ #category : 'accessing - ui' }
IceTipCherrypickPreviewBrowser >> diffPanel [

	^ diffPanel
]

{ #category : 'actions' }
IceTipCherrypickPreviewBrowser >> doCherryPick [

	| root |
	root := diffPanel model tree.
	root accept: IceMergeToChangeTreeVisitor new.
	self model repository workingCopy loadChangesInWorkingCopy: root.
	self closeWindow
]

{ #category : 'initialization' }
IceTipCherrypickPreviewBrowser >> initialExtentForWindow [

	^ (800 @ 600) scaledByDisplayScaleFactor
]

{ #category : 'initialization' }
IceTipCherrypickPreviewBrowser >> initializePresenters [

	diffPanel := self instantiate: (IceTipMergeSelectingPanel onDiff: self model diff).
	buttonBar := self newButtonBar.
	buttonBar add: self newActionButton.

	diffPanel leftLabel: 'Working Copy'.
	diffPanel rightLabel: ' With Cherrypicked commit '
]

{ #category : 'accessing - ui' }
IceTipCherrypickPreviewBrowser >> mainList [
	"Answer the presenter that is the main list of items of this browser."

	^ diffPanel iceNodesTree
]

{ #category : 'accessing - ui' }
IceTipCherrypickPreviewBrowser >> mainListActions: anActionGroup [
	"Answer the presenter that is the main list of items of this browser."

	^ diffPanel mainListActions: anActionGroup
]

{ #category : 'accessing' }
IceTipCherrypickPreviewBrowser >> mergeType: anObject [
	
	self model mergeType: anObject
]

{ #category : 'private - factory' }
IceTipCherrypickPreviewBrowser >> newActionButton [

	^ self newButton
		label: 'Apply';
		icon: (self iconNamed: #merge);
		help: 'Apply changes into your Working Copy';
		action: [ self doCherryPick ];
		yourself
]

{ #category : 'initialization' }
IceTipCherrypickPreviewBrowser >> titleForWindow [

	^ 'Preview result of Cherrypick'
]
