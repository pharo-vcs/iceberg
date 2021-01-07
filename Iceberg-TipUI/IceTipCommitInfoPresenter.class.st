"
I'm a panel to show the history of a commitish (usually a branch or a tag). I display infos on it and diffs.

I'm usually used as part of an IceTipHistoryBrowser.
"
Class {
	#name : #IceTipCommitInfoPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'model',
		'selectedModel',
		'headTabContainer',
		'ancestorTabContainer',
		'notebookPanel',
		'infoPage',
		'headPage',
		'ancestorPage'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #specs }
IceTipCommitInfoPresenter class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: #notebookPanel;
		  yourself
]

{ #category : #accessing }
IceTipCommitInfoPresenter >> beForCommit [

	headTabContainer := IceTipHistoryDiffFromHead tab: headPage.
	ancestorTabContainer := IceTipHistoryDiffToAncestor tab: ancestorPage
]

{ #category : #accessing }
IceTipCommitInfoPresenter >> beForMerge [

	headTabContainer := IceTipHistoryDiffToHead tab: headPage.
	ancestorTabContainer := IceTipHistoryDiffToAncestor tab: ancestorPage
]

{ #category : #private }
IceTipCommitInfoPresenter >> commitInfo [

	selectedModel ifNil: [ ^ self newEmpty ].
	^ IceTipReadOnlyFormBuilder newBuiltFor: selectedModel info
]

{ #category : #private }
IceTipCommitInfoPresenter >> diffFromAncestor [
	
	selectedModel ifNil: [ ^ self newEmpty ].
	^ IceTipDiffPanel on: (ancestorTabContainer diffFor: selectedModel)
]

{ #category : #private }
IceTipCommitInfoPresenter >> diffFromHead [
	
	selectedModel ifNil: [ ^ self newEmpty ].
	^ IceTipDiffPanel on: (headTabContainer diffFor: selectedModel)
]

{ #category : #initialization }
IceTipCommitInfoPresenter >> initialize [
	self beForCommit.
	super initialize
]

{ #category : #initialization }
IceTipCommitInfoPresenter >> initializeCommitPanel [
	"This will be initialised in fact on the first refresh"

	notebookPanel
		addPage: (infoPage := self newInfoPage);
		addPage: (headPage := self newDiffPage 
			title: 'Diff from HEAD';
			presenterProvider: [ self diffFromHead ];
			yourself);
		addPage: (ancestorPage := self newDiffPage 
			title: 'Diff from ancestor';
			presenterProvider: [ self diffFromAncestor ];
			yourself)
]

{ #category : #initialization }
IceTipCommitInfoPresenter >> initializeWidgets [

	notebookPanel := self newNotebook.
	self initializeCommitPanel.
	
	self focusOrder add: notebookPanel
]

{ #category : #'private factory' }
IceTipCommitInfoPresenter >> newDiffPage [

	^ SpNotebookPage 
		title: 'Diff'
		icon: (self iconNamed: #diff)
		provider: [ "It will be overriden" ]
]

{ #category : #'private factory' }
IceTipCommitInfoPresenter >> newEmpty [

	^ self newLabel
		  label: '(No commit selected)';
		  yourself
]

{ #category : #'private factory' }
IceTipCommitInfoPresenter >> newInfoPage [

	^ SpNotebookPage  
		title: 'Info'
		icon: (self iconNamed: #smallQuestion)
		provider: [ self commitInfo ]
]

{ #category : #'private factory' }
IceTipCommitInfoPresenter >> newInfoTab [
	^ self newTab 
		label: 'Info';
		icon: (self iconNamed: #smallQuestion);
		closeable: false;
		yourself
]

{ #category : #accessing }
IceTipCommitInfoPresenter >> refresh [
	
	selectedModel ifNil: [ ^ self ].
	
	headPage title: (headTabContainer labelFor: selectedModel).
	ancestorPage title: (ancestorTabContainer labelFor: selectedModel).
	notebookPanel resetAllPageContents
]

{ #category : #private }
IceTipCommitInfoPresenter >> refreshDiffFromAncestor [
	ancestorTabContainer updateContentsOn: selectedModel
]

{ #category : #private }
IceTipCommitInfoPresenter >> refreshDiffFromAncestorLabel [
	ancestorTabContainer updateLabelOn: selectedModel
]

{ #category : #private }
IceTipCommitInfoPresenter >> refreshDiffFromHead [
	headTabContainer updateContentsOn: selectedModel
]

{ #category : #private }
IceTipCommitInfoPresenter >> refreshDiffFromHeadLabel [
	headTabContainer updateLabelOn: selectedModel
]

{ #category : #accessing }
IceTipCommitInfoPresenter >> selectedModel: aModel [

	selectedModel := aModel.
	self refresh
]

{ #category : #initialization }
IceTipCommitInfoPresenter >> setModelBeforeInitialization: anObject [
	model := anObject
]
