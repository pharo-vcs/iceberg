"
I'm a browser to commit changes to a repository.

(self onRepository: IceRepository registry anyOne) openWithSpec
"
Class {
	#name : #IceTipCommitBrowser,
	#superclass : #IceTipBrowser,
	#instVars : [
		'diffPanel',
		'commentPanel',
		'saveAction'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #commands }
IceTipCommitBrowser class >> buildGeneralCommandGroupWith: presenter for: aCommandGroup [

	aCommandGroup register: IceTipRefreshCommitCommand forSpec
]

{ #category : #commands }
IceTipCommitBrowser class >> buildSelectionCommandGroupWith: presenter for: aCommandGroup [

	{ 	IceTipBrowseCommand.
		IceTipRevertChangeCommand }
			do: [ :each |
				aCommandGroup register: each forSpec ]

]

{ #category : #specs }
IceTipCommitBrowser class >> defaultSpec [

	^ SpPanedLayout newVertical
		  add: #diffPanel;
		  add: #commentPanel;
		  yourself
]

{ #category : #'instance creation' }
IceTipCommitBrowser class >> onRepository: aRepository [

	^ self on: (IceTipRepositoryModel on: aRepository)
]

{ #category : #actions }
IceTipCommitBrowser >> accept [

	^ self doCommit
]

{ #category : #'accessing ui' }
IceTipCommitBrowser >> commentPanel [

	^ commentPanel
]

{ #category : #'accessing ui' }
IceTipCommitBrowser >> commentPanel: aSpPresenter [

	commentPanel := aSpPresenter
]

{ #category : #'accessing ui' }
IceTipCommitBrowser >> diffPanel [

	^ diffPanel
]

{ #category : #'accessing ui' }
IceTipCommitBrowser >> diffPanel: aSpPresenter [

	diffPanel := aSpPresenter
]

{ #category : #actions }
IceTipCommitBrowser >> doCommit [

	self
		doCommit: diffPanel selectedItems
		message: commentPanel message
		pushing: commentPanel isPushing
		saving: commentPanel isSaving
]

{ #category : #actions }
IceTipCommitBrowser >> doCommit: aCollection message: aString pushing: pushingBoolean saving: savingBoolean [

	self model
		commit:
			(IceTipCommitAction new
				diff: self model workingCopyDiff;
				items: aCollection;
				message: aString;
				yourself)
		then: [ self verifyNeedsRefreshOrClose.
			pushingBoolean
				ifTrue: [ (IceTipPushAction new repository: self model entity) execute ].
			savingBoolean
				ifTrue: [ saveAction execute ] ]
]

{ #category : #accessing }
IceTipCommitBrowser >> initialExtentForWindow [

	^ (800@600) scaledByDisplayScaleFactor
]

{ #category : #accessing }
IceTipCommitBrowser >> initialize [ 

	super initialize.
	saveAction := IceTipSaveImageAction new
]

{ #category : #initialization }
IceTipCommitBrowser >> initializePresenters [

	super initializePresenters.
	
	diffPanel := self instantiate: IceTipDiffSelectingPanel on: self model workingCopyDiff.
	diffPanel leftLabel: 'Repository'.
	diffPanel rightLabel: 'Working Copy'.
	
	commentPanel := self instantiate: IceTipCommentPanel on: self model.
	commentPanel onCommit: [ self doCommit ].
	
"	self addShortcutsTo: commentPanel commentText.
	self addShortcutsTo: self.
"
]

{ #category : #'accessing ui' }
IceTipCommitBrowser >> mainList [
	"Answer the presenter that is the main list of items of this browser."

	^ diffPanel iceNodesTree
]

{ #category : #accessing }
IceTipCommitBrowser >> refresh [

	diffPanel refresh
]

{ #category : #private }
IceTipCommitBrowser >> refreshWhenRepository: ann [

	(self model isModelOf: ann repository)
		ifFalse: [ ^ self ].
	self model reset.
	self refresh
]

{ #category : #accessing }
IceTipCommitBrowser >> saveAction: anAction [

	saveAction := anAction
]

{ #category : #initialization }
IceTipCommitBrowser >> subscribeToAnnouncements [

	self announcer
		when: IceTipDiffRefreshed
		send: #refreshWhenRepository:
		to: self
]

{ #category : #accessing }
IceTipCommitBrowser >> titleForWindow [

	^ 'Commit on {1} branch {2}' format: { 
			  self model name.
			  self model branchName }
]

{ #category : #private }
IceTipCommitBrowser >> verifyNeedsRefreshOrClose [
	"Verifies if there are remaining changes to commit. 
	 In case there are none, close the window."
	
	self model reset.
	diffPanel model reset.
	diffPanel model isEmpty
		ifTrue: [ ^ self closeWindow ].
	self commentPanel clear. 
	diffPanel basicRefresh
]
