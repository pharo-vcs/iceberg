Class {
	#name : #IceTipCherrypickPreviewBrowser,
	#superclass : #IceTipBrowser,
	#instVars : [
		'diffPanel',
		'buttonBar'
	],
	#category : #'Iceberg-TipUI-View-Branch'
}

{ #category : #specs }
IceTipCherrypickPreviewBrowser class >> defaultSpec [
	<spec: #default>
	^ SpBoxLayout newVertical
		add: #diffPanel;
		add: #buttonBar height: self buttonHeight  ;
		yourself
]

{ #category : #'instance creation' }
IceTipCherrypickPreviewBrowser class >> onCommitish: aCommitish [
	^ self
		on:
			(IceTipCherrypickModel onCommitish: aCommitish)
]

{ #category : #initialization }
IceTipCherrypickPreviewBrowser >> buttonBar [
^	buttonBar 
]

{ #category : #initialization }
IceTipCherrypickPreviewBrowser >> buttonBar: aSpButtonBarPresenter [
	buttonBar  := aSpButtonBarPresenter
]

{ #category : #accessing }
IceTipCherrypickPreviewBrowser >> contextClass [
	self
		flag: 'Est-ce important si on a pas de menu commander ? comment ça marche ?'.
		^IceTipCommitContext.
]

{ #category : #initialization }
IceTipCherrypickPreviewBrowser >> diffPanel [
	^diffPanel
]

{ #category : #initialization }
IceTipCherrypickPreviewBrowser >> diffPanel: anObject [
	diffPanel := anObject
]

{ #category : #actions }
IceTipCherrypickPreviewBrowser >> doCherryPick [
|root|
	root := diffPanel model tree.
			root accept: IceMergeToChangeTreeVisitor new.
			self model repository workingCopy loadChangesInWorkingCopy: root.
			self window close
]

{ #category : #accessing }
IceTipCherrypickPreviewBrowser >> initialExtent [
	^ (800 @ 600) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipCherrypickPreviewBrowser >> initializeWidgets [
	super initializeWidgets.

	diffPanel := self
		instantiate: (IceTipMergeSelectingPanel onDiff: self model diff).
	buttonBar := self newButtonBar.
	buttonBar add: self newActionButton.

	self addShortcutsTo: self.

	self focusOrder
		add: self buttonBar;
		add: self diffPanel.

	diffPanel leftLabel: 'Working Copy'.
	diffPanel rightLabel: ' With Cherrypicked commit '
]

{ #category : #accessing }
IceTipCherrypickPreviewBrowser >> mergeType: anObject [
	
	self model mergeType: anObject
]

{ #category : #'private factory' }
IceTipCherrypickPreviewBrowser >> newActionButton [

	^ self newButton
		label: 'Apply';
		icon: (self iconNamed: #merge);
		help: 'Apply changes into your Working Copy';
		action: [ self doCherryPick ];
		yourself
]

{ #category : #api }
IceTipCherrypickPreviewBrowser >> title [
	^ 'Preview result of Cherrypick'
]
