"
I'm a browser and panel to show the version history of a method. 

For versions, I show the same commands of a regular history browser, but add some special commands.

(self onRepository: aRepository method: aMethod) openWithSpec.


"
Class {
	#name : #IceTipVersionHistoryBrowser,
	#superclass : #IceTipBrowser,
	#instVars : [
		'commitList',
		'selectedModel',
		'infoPage',
		'diffPage',
		'commitPanel'
	],
	#category : #'Iceberg-TipUI-View-Versions'
}

{ #category : #commands }
IceTipVersionHistoryBrowser class >> buildGeneralCommandGroupWith: presenter for: aCommandGroup [

	"Nothing to add"
]

{ #category : #commands }
IceTipVersionHistoryBrowser class >> buildSelectionCommandGroupWith: presenter for: aCommandGroup [

	{ 	IceTipInstallVersionCommand }
			do: [ :each |
				aCommandGroup register: each forSpec ]

]

{ #category : #specs }
IceTipVersionHistoryBrowser class >> defaultSpec [
	
	^ SpPanedLayout newVertical
		add: #commitList;
		add: #commitPanel;
		yourself
]

{ #category : #'instance creation' }
IceTipVersionHistoryBrowser class >> onRepository: aRepository method: aMethod [
	
	^ self on: (IceTipVersionHistoryModel 
		repositoryModel: (IceTipRepositoryModel on: aRepository) beCached 
		on: aMethod)
		beCached
]

{ #category : #accessing }
IceTipVersionHistoryBrowser >> commitList [

	^ commitList
]

{ #category : #accessing }
IceTipVersionHistoryBrowser >> initialExtentForWindow [

	^ (700@700) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipVersionHistoryBrowser >> initializeCommitList [

	commitList
		beResizable;
		addColumn:
			(SpStringTableColumn new
				title: 'Timestamp';
				evaluated: [ :each | each timeStamp asLocalStringYMDHM ];
				width: 110 * self currentWorld displayScaleFactor;
				yourself);
		addColumn:
			(SpStringTableColumn new
				title: 'Commit';
				evaluated: #shortId;
				width: 60 * self currentWorld displayScaleFactor;
				yourself);
		addColumn:
			(SpStringTableColumn new
				title: 'Author';
				evaluated: #author;
				width: 150 * self currentWorld displayScaleFactor;
				yourself);
		addColumn:
			(SpStringTableColumn new
				title: 'Description';
				evaluated: #descriptionWithDecoration;
				yourself).
				
	commitList whenSelectionChangedDo: [ :s |
		self selectionChanged: s ].

]

{ #category : #initialization }
IceTipVersionHistoryBrowser >> initializeCommitPanel [
	"This will be initialised in fact on the first refresh"

	commitPanel
		addPage: (infoPage := self newInfoPage);
		addPage: (diffPage := self newDiffPage 
			title: 'Diff from ancestor';
			presenterProvider: [ self newDiffPresenter ];
			yourself)
]

{ #category : #initialization }
IceTipVersionHistoryBrowser >> initializePresenters [

	super initializePresenters.	
	commitList := self newTable.
	commitPanel := self newNotebook.
	
	self initializeCommitList.
	self initializeCommitPanel.
	
	self refresh
]

{ #category : #'accessing ui' }
IceTipVersionHistoryBrowser >> mainList [
	"Answer the presenter that is the main list of items of this browser."

	^ commitList
]

{ #category : #accessing }
IceTipVersionHistoryBrowser >> model: anObject [

	super model: anObject.
	self refresh
]

{ #category : #'private factory' }
IceTipVersionHistoryBrowser >> newDiffPage [

	^ SpNotebookPage  
		title: 'Diff'
		icon: (self iconNamed: #diff)
		provider: [ self newDiffPresenter ]
]

{ #category : #'private factory' }
IceTipVersionHistoryBrowser >> newDiffPanelLeft: leftString right: rightString [

	^ (self instantiate: SpDiffPresenter) 
		leftText: leftString;
		rightText: rightString;
		showOptions: false
]

{ #category : #private }
IceTipVersionHistoryBrowser >> newDiffPresenter [
	
	selectedModel ifNil: [ ^ self ].
	^ self 
		newDiffPanelLeft: ((self model commitModelAfter: selectedModel) 
			ifNotNil: #source
			ifNil: [ '' ])
		right: selectedModel source
]

{ #category : #'private factory' }
IceTipVersionHistoryBrowser >> newInfoPage [

	^ SpNotebookPage  
		title: 'Info'
		icon: (self iconNamed: #smallQuestion)
		provider: [ self newVersionInfoPresenter ]

]

{ #category : #private }
IceTipVersionHistoryBrowser >> newVersionInfoPresenter [
	
	selectedModel ifNil: [ ^ self ].
	^ IceTipReadOnlyFormBuilder newBuiltFor: selectedModel info
]

{ #category : #accessing }
IceTipVersionHistoryBrowser >> refresh [

	commitList items: self model commitModels.
	selectedModel := self model commitModels 
		ifNotEmpty: #first
		ifEmpty: [ nil ].
	self refreshCommitTabPanel
]

{ #category : #private }
IceTipVersionHistoryBrowser >> refreshCommitTabPanel [
	
	selectedModel ifNil: [ ^ self ].
	diffPage title: ('{1} to {2}' format: { 
		(self model commitModelAfter: selectedModel) 
			ifNotNil: #shortId
			ifNil: [ 'origin' ].
		selectedModel shortId }).
	commitPanel resetAllPageContents
]

{ #category : #'event handling' }
IceTipVersionHistoryBrowser >> selectionChanged: aSelection [

	selectedModel := aSelection selectedItem.
	self refreshCommitTabPanel
]

{ #category : #accessing }
IceTipVersionHistoryBrowser >> titleForWindow [

	^ self model  
		ifNotNil: [ 'Versions of {1}' format: { self model name } ]
		ifNil: [ 'Versions' ]
]
