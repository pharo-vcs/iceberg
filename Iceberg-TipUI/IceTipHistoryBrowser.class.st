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
	#category : #'Iceberg-TipUI-View'
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

{ #category : #specs }
IceTipHistoryBrowser class >> defaultSpec [

	^ SpPanedLayout newVertical
		  add: #commitList;
		  add: #commitInfoTabs;
		  yourself
]

{ #category : #specs }
IceTipHistoryBrowser class >> panelSpec [
	<spec>
	
	^ SpPanedLayout newVertical
		add: #commitList;
		add: #commitInfoTabs;
		yourself
]

{ #category : #accessing }
IceTipHistoryBrowser >> beForMerge [

	self commitInfoTabs beForMerge
]

{ #category : #'accessing ui' }
IceTipHistoryBrowser >> commitInfoTabs [

	^ commitInfoTabs
]

{ #category : #'accessing ui' }
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
		addColumn:
			((SpStringTableColumn
				evaluated: [ :each | each timeStamp asLocalStringYMDHM ])
				title: 'Timestamp';
				width: 110 * self currentWorld displayScaleFactor;
				yourself);
		addColumn:
			((SpStringTableColumn evaluated: #shortId)
				title: 'Commit';
				width: 60 * self currentWorld displayScaleFactor;
				yourself);
		addColumn:
			((SpStringTableColumn evaluated: #author)
				title: 'Author';
				width: 150 * self currentWorld displayScaleFactor;
				yourself);
		addColumn:
			((SpStringTableColumn evaluated: #descriptionWithDecoration)
				title: 'Description';
				yourself);
		whenSelectionChangedDo: [ commitInfoTabs selectedModel: self selectedCommit ]

]

{ #category : #initialization }
IceTipHistoryBrowser >> initializePresenters [

	super initializePresenters.	
	commitList := self newTable.
	commitInfoTabs := self instantiate: IceTipCommitInfoPresenter.
	
	self initializeCommitList.
		
	self refreshCommitList.
]

{ #category : #'accessing ui' }
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
IceTipHistoryBrowser >> selectionChanged: ann [

	commitInfoTabs selectedModel:
		(ann newSelectedIndexes
			 ifNotEmpty: [ :indexes | 
				 self commitList widget dataSource elementAt: indexes first ]
			 ifEmpty: [ nil ])

]

{ #category : #accessing }
IceTipHistoryBrowser >> titleForWindow [

	^ self model
		ifNotNil: [ 'History of {1}' format: {self model repositoryName} ]
		ifNil: [ 'History' ]

]
