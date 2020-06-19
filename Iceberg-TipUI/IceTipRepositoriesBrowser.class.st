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

{ #category : #specs }
IceTipRepositoriesBrowser class >> defaultSpec [
	<spec: #default>
	^ SpBoxLayout newVertical 
		add: #toolbar expand: false fill: true padding: 0;
			add: #repositoryList;
			yourself 
]

{ #category : #accessing }
IceTipRepositoriesBrowser class >> icon [
	^ self iconNamed: #komitterSmalltalkhubRemote
]

{ #category : #'world menu' }
IceTipRepositoriesBrowser class >> menuCommandOn: aBuilder [ 
	"Add a custom menu item to the world menu"	
	<worldMenu> 
	
	(aBuilder item: #'Iceberg')
		order: 0.8; 
		icon: self icon;  
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

{ #category : #accessing }
IceTipRepositoriesBrowser >> contextClass [
	^ IceTipRepositoryListContext
]

{ #category : #'private factory' }
IceTipRepositoriesBrowser >> createCommandContext [
	^ self newContextWithSelection: self repositorySelected
]

{ #category : #initialization }
IceTipRepositoriesBrowser >> initializeRepositoryList [
	| items |
	items := self model repositories.
	repositoryList
		showColumnHeaders;
		beResizable;
		addColumn:
			((SpStringTableColumn evaluated: #descriptionWithDecoration)
				width: 200;
				title: self title;
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
		items: items;
		selectIndex: 1;
		activateOnDoubleClick;
		whenActivatedDo: [ self repositoryStrongSelection: self repositorySelected ];
		contextMenu: [ self buildMenu ]
]

{ #category : #initialization }
IceTipRepositoriesBrowser >> initializeWidgets [
	super initializeWidgets.
	repositoryList := self newTable.
	self initializeRepositoryList.
	self focusOrder add: repositoryList.	
	
]

{ #category : #testing }
IceTipRepositoriesBrowser >> isShowingRepository: anIceLibgitRepository [

	^ self repositoryModels anySatisfy: [ :aRepositoryModel |
			aRepositoryModel entity = anIceLibgitRepository ]
]

{ #category : #'private factory' }
IceTipRepositoriesBrowser >> newContextWithSelection: anObject [ 
	^ self newContext 
		repositoryModel: anObject;
		yourself
]

{ #category : #private }
IceTipRepositoriesBrowser >> refresh [

	repositoryList items: self model repositories.
]

{ #category : #accessing }
IceTipRepositoriesBrowser >> repositoryList [
	^ repositoryList
]

{ #category : #accessing }
IceTipRepositoriesBrowser >> repositoryList: anObject [
	repositoryList := anObject
]

{ #category : #accessing }
IceTipRepositoriesBrowser >> repositoryModels [
	"Return the currently shown repository models"
	^ repositoryList items
]

{ #category : #private }
IceTipRepositoriesBrowser >> repositorySelected [
	^ repositoryList selection selectedItem
]

{ #category : #private }
IceTipRepositoriesBrowser >> repositoryStrongSelection: selection [
	
	| context |
	
	context := self newContextWithSelection: selection.
	
	IceTipCommandStrongSelectionActivation
		activateAllInContext: context
		by: [ :each | each executeCommand ]
]

{ #category : #initialization }
IceTipRepositoriesBrowser >> subscribeToAnnouncements [
	Iceberg announcer weak 
		when: IceAnnouncement send: #refresh to: self.

]

{ #category : #accessing }
IceTipRepositoriesBrowser >> title [
	^ 'Repositories'
]
