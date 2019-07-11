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
add: #toolbar height: IceTipToolbar defaultHeight;
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

{ #category : #accessing }
IceTipRepositoriesBrowser >> contextClass [
	^ IceTipRepositoryListContext
]

{ #category : #'private factory' }
IceTipRepositoriesBrowser >> createCommandContext [
	^ self newContextWithSelection: self repositorySelected
]

{ #category : #initialization }
IceTipRepositoriesBrowser >> initialize [
	self model: IceTipRepositoriesModel new.
	super initialize
]

{ #category : #initialization }
IceTipRepositoriesBrowser >> initializeRepositoryList [
	| items |
	items := self newRepositoriesDataSource.
	repositoryList
		showColumnHeaders;
		addColumn:
			((SpStringTableColumn evaluated: #descriptionWithDecoration)
				width: 200;
				title: self title;
				yourself);
		addColumn:
			((SpStringTableColumn evaluated: #status)
				width: 150;
				title: #Status;
				yourself);
		addColumn:
			((SpStringTableColumn evaluated: #branchName)
				title: #Branch;
				yourself);
		items: items;
		selectIndex: 1;
		contextMenu: [ self buildMenu ].
]

{ #category : #initialization }
IceTipRepositoriesBrowser >> initializeWidgets [
	super initializeWidgets.
	repositoryList := self newTable.
	self initializeRepositoryList.
	self focusOrder add: repositoryList.	
	
	"
	repositoryList := self newIceTable.
	repositoryList widget
		onAnnouncement: FTStrongSelectionChanged 
		send: #repositoryStrongSelection: 
		to: self.

	
"
]

{ #category : #'private factory' }
IceTipRepositoriesBrowser >> newContextWithSelection: anObject [ 
	^ self newContext 
		repositoryModel: anObject;
		yourself
]

{ #category : #'private factory' }
IceTipRepositoriesBrowser >> newRepositoriesDataSource [
	| datasource |
	datasource := IceTipDataSource new
		tool: self;
		elements: self model repositories;
		yourself.
	^ datasource elements 
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
IceTipRepositoriesBrowser >> repositoryList: anObject [
	repositoryList := anObject
]

{ #category : #private }
IceTipRepositoriesBrowser >> repositorySelected [
	^ repositoryList selection selectedItem
]

{ #category : #private }
IceTipRepositoriesBrowser >> repositoryStrongSelection: ann [
	| selection context |
	selection := repositoryList widget dataSource
		elementAt: ann selectedIndex.
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
