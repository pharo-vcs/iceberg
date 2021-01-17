"
I'm a tool to show all repositories registered on this image. 
I define basic actions and an entry point to manage each repository individually.

IceTipRepositoriesBrowser new openWithSpec.
"
Class {
	#name : #IceTipRepositoriesBrowser,
	#superclass : #IceTipBrowser,
	#instVars : [
		'repositoryList'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #commands }
IceTipRepositoriesBrowser class >> buildGeneralCommandGroupWith: presenter for: aCommandGroup [

	{ 	IceTipFetchAllProjectCommand.
		IceTipAddRepositoryCommand.
		IceTipSettingsCommand
		} do: [ :each | 
			aCommandGroup register: each forSpec ]

]

{ #category : #commands }
IceTipRepositoriesBrowser class >> buildSelectionCommandGroupWith: presenter for: aCommandGroup [

	{
		IceTipRepairCommand.
		IceTipManagePackagesCommand.
		IceTipCommitCommand.
		IceTipPullCommand.
		IceTipPushCommand.
		IceTipFetchCommand.
		IceTipCheckoutBranchCommand.
	 	IceTipCreateTagCommand.
		IceTipMergeCommand.
		IceTipManageRepositoryCommand.
		IceTipEditRepositoryCommand.
		IceTipForgetRepositoryCommand.
		} do: [ :each |
			aCommandGroup register: each forSpec ]

]

{ #category : #commands }
IceTipRepositoriesBrowser class >> buildSelectionExtraCommandGroupWith: presenter for: aCommandGroup [

	super buildSelectionExtraCommandGroupWith: presenter for: aCommandGroup.

	{	IceTipCalculateDirtyPackagesCommand.
		IceTipCopyCommitishCommand.
		IceTipOpenNativelyCommand.
		} do: [ :each |
			aCommandGroup register: each forSpec ]

]

{ #category : #specs }
IceTipRepositoriesBrowser class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: #repositoryList;
		  yourself
]

{ #category : #accessing }
IceTipRepositoriesBrowser class >> iconForWorldMenu [

	^ self iconNamed: #komitterSmalltalkhubRemote
]

{ #category : #'world menu' }
IceTipRepositoriesBrowser class >> menuCommandOn: aBuilder [ 
	"Add a custom menu item to the world menu"	
	<worldMenu> 
	
	(aBuilder item: #'Iceberg')
		order: 0.8;
		icon: self iconForWorldMenu;
		parent: #'Tools';
		keyText: 'o, i';
		help: 'Iceberg is a set of tools that allow one to handle git repositories directly from a Pharo image.';
		action: [ self new openWithSpec ]
]

{ #category : #'instance creation' }
IceTipRepositoriesBrowser class >> new [
	
	^ self newOnRepositoryProvider: IceRepository
]

{ #category : #'instance creation' }
IceTipRepositoriesBrowser class >> newOnRepositoryProvider: aProvider [ 

	^ self basicNew
		model: (IceTipRepositoriesModel new repositoryProvider: aProvider; yourself);
		initialize;
		yourself
]

{ #category : #initialization }
IceTipRepositoriesBrowser >> iconForWindow [

	^ self class iconForWorldMenu
]

{ #category : #initialization }
IceTipRepositoriesBrowser >> initializePresenters [

	super initializePresenters.
	repositoryList := self newTable.
	self initializeRepositoryList.

	self refresh.
]

{ #category : #initialization }
IceTipRepositoriesBrowser >> initializeRepositoryList [

	repositoryList
		showColumnHeaders;
		beResizable;
		addColumn:
			((SpStringTableColumn evaluated: #descriptionWithDecoration)
				width: 200;
				title: self titleForWindow;
				yourself);
		addColumn:
			((SpStringTableColumn evaluated: #statusText)
				width: 150;
				title: #Status;
				yourself);
		addColumn:
			((SpStringTableColumn evaluated: #branchNameText)
				title: #Branch;
				yourself);
		activateOnDoubleClick;
		whenActivatedDo: [ self openManagePackagesWindow ]
]

{ #category : #testing }
IceTipRepositoriesBrowser >> isShowingRepository: anIceLibgitRepository [

	^ self repositoryModels anySatisfy: [ :aRepositoryModel | 
		  aRepositoryModel entity = anIceLibgitRepository ]
]

{ #category : #'accessing ui' }
IceTipRepositoriesBrowser >> mainList [

	^ repositoryList
]

{ #category : #private }
IceTipRepositoriesBrowser >> openManagePackagesWindow [

	IceTipManagePackagesCommand new
		context: self;
		execute
]

{ #category : #private }
IceTipRepositoriesBrowser >> refresh [

	repositoryList items: self model repositories
]

{ #category : #accessing }
IceTipRepositoriesBrowser >> repositoryList [

	^ repositoryList
]

{ #category : #accessing }
IceTipRepositoriesBrowser >> repositoryModel [
	
	^ self selectedItem
]

{ #category : #accessing }
IceTipRepositoriesBrowser >> repositoryModels [
	"Return the currently shown repository models"

	^ repositoryList items

]

{ #category : #initialization }
IceTipRepositoriesBrowser >> subscribeToAnnouncements [

	Iceberg announcer weak when: IceAnnouncement send: #refresh to: self
]

{ #category : #initialization }
IceTipRepositoriesBrowser >> titleForWindow [

	^ 'Repositories'
]
