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

{ #category : #specs }
IceTipCommitBrowser class >> defaultSpec [
	<spec: #default>
	^ SpBoxLayout newVertical
		add: #toolbar expand: false fill: true padding: 0;
		add:
			(SpPanedLayout newVertical
				add: #diffPanel;
				add: #commentPanel;
				yourself);
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
IceTipCommitBrowser >> commentPanel: anObject [
	commentPanel := anObject
]

{ #category : #accessing }
IceTipCommitBrowser >> contextClass [
	^ IceTipCommitContext
]

{ #category : #'accessing ui' }
IceTipCommitBrowser >> diffPanel [
	^ diffPanel
]

{ #category : #'accessing ui' }
IceTipCommitBrowser >> diffPanel: anObject [
	diffPanel := anObject
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
IceTipCommitBrowser >> initialExtent [
	^ (800@600) scaledByDisplayScaleFactor
]

{ #category : #accessing }
IceTipCommitBrowser >> initialize [ 

	super initialize.
	saveAction := IceTipSaveImageAction new
]

{ #category : #initialization }
IceTipCommitBrowser >> initializeWidgets [
	super initializeWidgets.
	
	diffPanel := self instantiate: IceTipDiffSelectingPanel on: self model workingCopyDiff.
	diffPanel leftLabel: 'Repository'.
	diffPanel rightLabel: 'Working Copy'.
	
	commentPanel := self instantiate: IceTipCommentPanel on: self model.
	commentPanel onCommit: [ self doCommit ].
	
	self addShortcutsTo: commentPanel commentText.
	self addShortcutsTo: self.

	self focusOrder 
		add: commentPanel;
		add: diffPanel
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
IceTipCommitBrowser >> title [
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
		ifTrue: [ ^ self window close ].
	self commentPanel clear. 
	diffPanel basicRefresh
]
