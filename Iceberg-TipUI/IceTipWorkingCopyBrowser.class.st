"
I'm a tool to show the internals of a repository from the point of view of an image. 
I show the packages managed by this repository and a series of actions to properly handle them in the context of an iceberg repository.

(IceTipPackagesBrowser forRepository: IceRepository registry anyOne) openWithSpec
"
Class {
	#name : 'IceTipWorkingCopyBrowser',
	#superclass : 'IceTipBrowser',
	#instVars : [
		'statusBar',
		'packagesTable',
		'filterInput'
	],
	#category : 'Iceberg-TipUI-View-WorkingCopy',
	#package : 'Iceberg-TipUI',
	#tag : 'View-WorkingCopy'
}

{ #category : 'commands' }
IceTipWorkingCopyBrowser class >> buildGeneralCommandGroupWith: presenter for: aCommandGroup [

	{	IceTipRepairCommand. 	
		IceTipCommitCommand.
		IceTipPushCommand.
		IceTipPullCommand.
		IceTipFetchCommand.
		IceTipCheckoutBranchCommand.
		IceTipMergeCommand.
		IceTipManageRepositoryCommand.
		IceTipDiscardChangesCommand.
		IceTipAddPackageCommand } 
		do: [ :each |
			aCommandGroup register: (each forSpecContext: presenter) ]

]

{ #category : 'commands' }
IceTipWorkingCopyBrowser class >> buildSelectionCommandGroupWith: presenter for: aCommandGroup [

	{ 	IceTipBrowsePackageCommand.
		IceTipBrowseRepositoryPackageVersionCommand.
		IceTipLoadPackageCommand.
		IceTipReloadPackageCommand.
		IceTipUnloadPackageCommand.
		IceTipUnloadAndRemovePackageCommand.
		IceTipRemoveFromRepositoryPackageCommand }
			do: [ :each | aCommandGroup register: (each forSpecContext: presenter) ]

]

{ #category : 'instance creation' }
IceTipWorkingCopyBrowser class >> onRepository: aRepository [

	^ self on: (IceTipWorkingCopyModel on: (IceTipRepositoryModel on: aRepository) workingCopy: aRepository workingCopy)
]

{ #category : 'accessing' }
IceTipWorkingCopyBrowser >> allListItems [

	^ self model packageModels
]

{ #category : 'private - actions' }
IceTipWorkingCopyBrowser >> browsePackage: aPackageModel [
	| commandClass |
	
	commandClass := aPackageModel isLoaded
		ifTrue: [ IceTipBrowsePackageCommand ]
		ifFalse: [ IceTipBrowseRepositoryPackageVersionCommand ].
		
	 commandClass new
		packageModel: aPackageModel;
		execute
]

{ #category : 'initialization' }
IceTipWorkingCopyBrowser >> connectPresenters [

	super connectPresenters.
	filterInput
		placeholder: 'Filter...';
		whenTextChangedDo: [ :text | self refreshPackagesTable ]

]

{ #category : 'layout' }
IceTipWorkingCopyBrowser >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: packagesTable;
		  add: filterInput expand: false;
		  yourself
]

{ #category : 'accessing - ui' }
IceTipWorkingCopyBrowser >> filterInput [

	^ filterInput
]

{ #category : 'private' }
IceTipWorkingCopyBrowser >> filteredItemsFor: pattern [

	^ self allListItems select: [ :each | 
		  each name asLowercase includesSubstring: pattern asLowercase ]
]

{ #category : 'private' }
IceTipWorkingCopyBrowser >> iconFor: aPackage [ 

	self decorations do: [ :each | 
		(each iconNameForPackage: aPackage) 
			ifNotNil: [ :aName | ^ self iconNamed: aName ] ].

	^ self iconNamed: #package
]

{ #category : 'initialization' }
IceTipWorkingCopyBrowser >> initialExtentForWindow [

	^ (700 @ 500) scaledByDisplayScaleFactor
]

{ #category : 'initialization' }
IceTipWorkingCopyBrowser >> initializePackagesTable [

	packagesTable
		beResizable;
		addColumn: (SpImageTableColumn new 
			beNotExpandable;
			evaluated: [ :aPackage | self iconFor: aPackage ];
			yourself);
		addColumn: (SpStringTableColumn new
			title: 'Name';
			evaluated: #description;
			displayColor: [ :each | each descriptionDecorator color ];
			displayBold: [ :each | each descriptionDecorator isBold ];
			displayItalic: [ :each | each descriptionDecorator isItalic ];			
			yourself);
		addColumn: (SpStringTableColumn new
			title: 'Status';
			evaluated: #status;
			displayColor: [ :each | each descriptionDecorator color ];
			displayBold: [ :each | each descriptionDecorator isBold ];
			displayItalic: [ :each | each descriptionDecorator isItalic ];			
			yourself);
		activateOnDoubleClick;
		whenActivatedDo: [ :selection | self browsePackage: selection selectedItem ]
]

{ #category : 'initialization' }
IceTipWorkingCopyBrowser >> initializePresenters [

	filterInput := self newTextInput.
	packagesTable := self newTable.
	self initializePackagesTable.
	statusBar := self instantiate: IceTipWorkingCopyStatusBarPresenter
]

{ #category : 'initialization' }
IceTipWorkingCopyBrowser >> initializeWindow: aSpWindowPresenter [
	
	super initializeWindow: aSpWindowPresenter.

	aSpWindowPresenter statusBar: statusBar.

]

{ #category : 'accessing - ui' }
IceTipWorkingCopyBrowser >> mainList [

	^ packagesTable
]

{ #category : 'accessing' }
IceTipWorkingCopyBrowser >> packageModel [
	
	^ packagesTable selectedItem
]

{ #category : 'accessing - ui' }
IceTipWorkingCopyBrowser >> packagesTable [

	^ packagesTable
]

{ #category : 'accessing' }
IceTipWorkingCopyBrowser >> refresh [

	self refreshCommands.
	self refreshStatusBar.
	self refreshPackagesTable
]

{ #category : 'private' }
IceTipWorkingCopyBrowser >> refreshPackagesTable [

	packagesTable items: (filterInput text
		ifEmpty: [ self allListItems ]
		ifNotEmpty: [ :pattern | self filteredItemsFor: pattern ])

]

{ #category : 'private' }
IceTipWorkingCopyBrowser >> refreshStatusBar [

	statusBar model: self model
]

{ #category : 'private' }
IceTipWorkingCopyBrowser >> refreshWhenRepository: ann [

	(ann repository isNil or: [ 
		self model repositoryModel isModelOf: ann repository ]) ifFalse: [ 
		^ self ].
	self model reset.
	self refresh

]

{ #category : 'accessing - model' }
IceTipWorkingCopyBrowser >> setModelBeforeInitialization: aWorkingCopyModel [

	self model: aWorkingCopyModel
]

{ #category : 'testing' }
IceTipWorkingCopyBrowser >> showsPackageNamed: aString [ 
	
	^ packagesTable items anySatisfy: [ :packageModel | packageModel name = aString ]
]

{ #category : 'accessing - ui' }
IceTipWorkingCopyBrowser >> statusBar [

	^ statusBar
]

{ #category : 'initialization' }
IceTipWorkingCopyBrowser >> subscribeToAnnouncements [

	Iceberg announcer weak
		when: IceRepositoryAnnouncement
		send: #refreshWhenRepository:
		to: self
]

{ #category : 'initialization' }
IceTipWorkingCopyBrowser >> titleForWindow [

	^ 'Working copy of ', self model repositoryName
]

{ #category : 'initialization' }
IceTipWorkingCopyBrowser >> updatePresenter [

	self refresh
]

{ #category : 'accessing' }
IceTipWorkingCopyBrowser >> workingCopyModel [
	
	^ self model
]
