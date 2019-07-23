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
IceTipCherrypickPreviewBrowser class >> onMergeTree: aMergeTree [
	^ self
		on:
			(IceTipCherrypickModel new
				mergeTree: aMergeTree;
				yourself)
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
IceTipCherrypickPreviewBrowser >> doMerge [

	self model executeMergeActionAndThen: [ self window delete ]
]

{ #category : #initialization }
IceTipCherrypickPreviewBrowser >> initializeWidgets [
	super initializeWidgets.

	diffPanel := self
		instantiate: (IceTipDiffSelectingPanel onDiff: self model diff).
	buttonBar := self newButtonBar.
	buttonBar add: self newActionButton.

	self whenBuiltDo: [ :ann | self addShortcutsTo: ann widget ].

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
		label: 'Merge';
		icon: (self iconNamed: #merge);
		help:
			('Merges into your Working Copy');
		action: [ self doMerge ];
		yourself
]

{ #category : #api }
IceTipCherrypickPreviewBrowser >> title [
	^ 'Preview result of Cherrypick'
]
