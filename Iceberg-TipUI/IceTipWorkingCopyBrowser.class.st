"
I'm a tool to show the internals of a repository from the point of view of an image. 
I show the packages managed by this repository and a series of actions to properly handle them in the context of an iceberg repository.

(IceTipPackagesBrowser forRepository: IceRepository registry anyOne) openWithSpec
"
Class {
	#name : #IceTipWorkingCopyBrowser,
	#superclass : #IceTipBrowser,
	#instVars : [
		'statusBar',
		'packagesTable',
		'filterInput'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #commands }
IceTipWorkingCopyBrowser class >> buildGeneralCommandGroupWith: presenter for: aCommandGroup [

	{ 	IceTipCommitCommand.
		IceTipPushCommand.
		IceTipPullCommand.
		IceTipFetchCommand.
		IceTipCheckoutBranchCommand.
		IceTipMergeCommand.
		IceTipManageRepositoryCommand.
		IceTipDiscardChangesCommand.
		IceTipAddPackageCommand } 
		do: [ :each |
			aCommandGroup register: each forSpec ]

]

{ #category : #commands }
IceTipWorkingCopyBrowser class >> buildSelectionCommandGroupWith: presenter for: aCommandGroup [

	{ 	IceTipBrowsePackageCommand.
		IceTipBrowseRepositoryPackageVersionCommand.
		IceTipLoadPackageCommand.
		IceTipReloadPackageCommand.
		IceTipUnloadPackageCommand.
		IceTipUnloadAndRemovePackageCommand.
		IceTipRemoveFromRepositoryPackageCommand }
			do: [ :each | aCommandGroup register: each forSpec ]

]

{ #category : #specs }
IceTipWorkingCopyBrowser class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: #packagesTable;
		  add: #filterInput expand: false;
		  yourself
]

{ #category : #'instance creation' }
IceTipWorkingCopyBrowser class >> onRepository: aRepository [

	^ self on: (IceTipRepositoryModel on: aRepository)
]

{ #category : #accessing }
IceTipWorkingCopyBrowser >> allListItems [

	^ self model packageModels
]

{ #category : #initialization }
IceTipWorkingCopyBrowser >> connectPresenters [

	super connectPresenters.
	filterInput
		placeholder: 'Filter...';
		whenTextChangedDo: [ :text | self refreshPackagesTable ]

]

{ #category : #'accessing ui' }
IceTipWorkingCopyBrowser >> filterInput [

	^ filterInput
]

{ #category : #private }
IceTipWorkingCopyBrowser >> filteredItemsFor: pattern [

	^ self allListItems select: [ :each | 
		  each name asLowercase includesSubstring: pattern asLowercase ]
]

{ #category : #initialization }
IceTipWorkingCopyBrowser >> initialExtentForWindow [

	^ (700 @ 500) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipWorkingCopyBrowser >> initializePackagesTable [

	packagesTable
		beResizable;
		addColumn: 
			(SpStringTableColumn
				title: 'Name'
				evaluated: #descriptionWithDecoration);
		addColumn:
			(SpStringTableColumn
				title: 'Status'
				evaluated: #statusWithDecoration)
]

{ #category : #initialization }
IceTipWorkingCopyBrowser >> initializePresenters [

	filterInput := self newTextInput.
	packagesTable := self newTable.
	self initializePackagesTable.
	statusBar := self instantiate: IceTipWorkingCopyStatusBar.

	self refresh.

]

{ #category : #initialization }
IceTipWorkingCopyBrowser >> initializeWindow: aSpWindowPresenter [
	
	super initializeWindow: aSpWindowPresenter.

	aSpWindowPresenter
		statusBar: statusBar
]

{ #category : #'accessing ui' }
IceTipWorkingCopyBrowser >> mainList [

	^ packagesTable
]

{ #category : #accessing }
IceTipWorkingCopyBrowser >> packageModel [
	
	^ packagesTable selectedItem
]

{ #category : #'accessing ui' }
IceTipWorkingCopyBrowser >> packagesTable [

	^ packagesTable
]

{ #category : #accessing }
IceTipWorkingCopyBrowser >> refresh [

	self rebuildToolbar.
	self refreshStatusBar.
	self refreshPackagesTable.

]

{ #category : #private }
IceTipWorkingCopyBrowser >> refreshPackagesTable [

	packagesTable items: (filterInput text
		ifEmpty: [ self allListItems ]
		ifNotEmpty: [ :pattern | self filteredItemsFor: pattern ])

]

{ #category : #private }
IceTipWorkingCopyBrowser >> refreshStatusBar [

	statusBar model: self model
]

{ #category : #private }
IceTipWorkingCopyBrowser >> refreshWhenRepository: ann [

	(ann repository isNil or: [ 
		self model repositoryModel isModelOf: ann repository ]) ifFalse: [ 
		^ self ].
	self model reset.
	self refresh

]

{ #category : #initialization }
IceTipWorkingCopyBrowser >> setModelBeforeInitialization: aRepositoryModel [

	self model: ( IceTipWorkingCopyModel on: aRepositoryModel )
]

{ #category : #testing }
IceTipWorkingCopyBrowser >> showsPackageNamed: aString [ 
	
	^ packagesTable items anySatisfy: [ :packageModel | packageModel name = aString ]
]

{ #category : #'accessing ui' }
IceTipWorkingCopyBrowser >> statusBar [

	^ statusBar
]

{ #category : #initialization }
IceTipWorkingCopyBrowser >> subscribeToAnnouncements [

	Iceberg announcer weak
		when: IceRepositoryAnnouncement
		send: #refreshWhenRepository:
		to: self
]

{ #category : #initialization }
IceTipWorkingCopyBrowser >> titleForWindow [

	^ 'Working copy of ', self model repositoryName
]
