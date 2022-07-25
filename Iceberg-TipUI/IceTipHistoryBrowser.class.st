"
I'm a browser and panel to show the history of a commitish (usually a branch or a tag). 
I'm usually used as part of an IceTipRepositoryBrowser.

(self onBranch: IceRepository registry anyOne branch) openWithSpec.
"
Class {
	#name : #IceTipHistoryBrowser,
	#superclass : #IceTipBrowser,
	#instVars : [
		'commitList',
		'commitInfoTabs'
	],
	#category : #'Iceberg-TipUI-View-Repository'
}

{ #category : #commands }
IceTipHistoryBrowser class >> buildGeneralCommandGroupWith: presenter for: aCommandGroup [

	"Nothing to add"
]

{ #category : #commands }
IceTipHistoryBrowser class >> buildSelectionCommandGroupWith: presenter for: aCommandGroup [

	{	IceTipAdoptCommitCommand.
		IceTipCheckoutNewBranchCommand.
		IceTipCheckoutCommitCommand.
		IceTipCreateTagCommand.
		IceTipResetBranchToThisCommitCommand.
		IceTipCopyCommitishCommand.
		IceTipCherryPickCommand.
		} do: [ :each |
			aCommandGroup register: each forSpec ]

]

{ #category : #layout }
IceTipHistoryBrowser class >> defaultLayout [

	^ SpPanedLayout newTopToBottom
		  add: #commitList;
		  add: #commitInfoTabs;
		  yourself
]

{ #category : #specs }
IceTipHistoryBrowser class >> panelSpec [
	
	^ SpPanedLayout newTopToBottom
		add: #commitList;
		add: #commitInfoTabs;
		yourself
]

{ #category : #accessing }
IceTipHistoryBrowser >> beForMerge [

	self commitInfoTabs beForMerge
]

{ #category : #'accessing - ui' }
IceTipHistoryBrowser >> commitInfoTabs [

	^ commitInfoTabs
]

{ #category : #'accessing - ui' }
IceTipHistoryBrowser >> commitList [

	^ commitList
]

{ #category : #initialization }
IceTipHistoryBrowser >> initialExtentForWindow [

	^ (700 @ 700) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipHistoryBrowser >> initializeCommitList [

	commitList
		beResizable;
		addColumn: ((SpStringTableColumn
			evaluated: [ :each | each timeStamp asLocalStringYMDHM ])
			title: 'Timestamp';
			width: 120;
			yourself);
		addColumn: ((SpStringTableColumn evaluated: #shortId)
			title: 'Commit';
			width: 70;
			yourself);	
		addColumn: ((SpStringTableColumn evaluated: #author)
			title: 'Author';
			width: 180;
			yourself);
		addColumn: ((SpStringTableColumn evaluated: [ :each | 
				each descriptionWithDecoration asString lines first ])
			title: 'Description';
			yourself);
		whenSelectionChangedDo: [ :aSelection | self selectionChanged: aSelection selectedItem ]
]

{ #category : #initialization }
IceTipHistoryBrowser >> initializePresenters [

	commitList := self newTable.
	commitInfoTabs := self instantiate: IceTipCommitInfoPresenter.
	
	self initializeCommitList
]

{ #category : #'accessing - ui' }
IceTipHistoryBrowser >> mainList [
	"Answer the presenter that is the main list of items of this browser."

	^ commitList
]

{ #category : #accessing }
IceTipHistoryBrowser >> model: anObject [

	super model: anObject.
	self refresh
]

{ #category : #accessing }
IceTipHistoryBrowser >> refresh [

	self refreshCommitList
]

{ #category : #accessing }
IceTipHistoryBrowser >> refreshCommitList [

	| commitModels |
	commitModels := self model commitModels.
	commitList items: commitModels.
	commitInfoTabs selectedModel: (commitModels ifNotEmpty: #first ifEmpty: [ nil ])

]

{ #category : #accessing }
IceTipHistoryBrowser >> selectedCommit [

	^ commitList selection selectedItem
]

{ #category : #'event handling' }
IceTipHistoryBrowser >> selectionChanged: anElement [

	commitInfoTabs selectedModel: anElement
]

{ #category : #initialization }
IceTipHistoryBrowser >> titleForWindow [

	^ self model
		ifNotNil: [ 'History of {1}' format: {self model repositoryName} ]
		ifNil: [ 'History' ]

]

{ #category : #initialization }
IceTipHistoryBrowser >> updatePresenter [

	self refreshCommitList
]

{ #category : #events }
IceTipHistoryBrowser >> whenSelectionChangedDo: aBlock [ 
	
	commitList whenSelectionChangedDo: aBlock
]
