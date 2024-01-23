Class {
	#name : 'IceTipRepositoryGroupPanel',
	#superclass : 'SpPresenter',
	#traits : 'SpTModel',
	#classTraits : 'SpTModel classTrait',
	#instVars : [
		'repositoryList',
		'repositoryFilter'
	],
	#category : 'Iceberg-TipUI-View-Repository',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Repository'
}

{ #category : 'commands' }
IceTipRepositoryGroupPanel class >> buildCommandsGroupWith: presenter forRoot: aCommandGroup [

	self flag: #HACK. "I extracted this panel from IceTipRepositoriesBrowser, 
	but I do not want to extract all the machinery that is it in (which is a mess)
	so for now, until I get time to refactor all that, I am just pointing there"
	^ IceTipRepositoriesBrowser 
		buildCommandsGroupWith: presenter 
		forRoot: aCommandGroup
]

{ #category : 'commands' }
IceTipRepositoryGroupPanel class >> buildRootCommandsGroupFor: aPresenter [
	| rootCommandGroup |

	rootCommandGroup := super buildRootCommandsGroupFor: aPresenter.
	"since historically this menu was residing on IceTipRepositoriesBrowser,
	 the place to put extensions was there. To not lose this place (is a good entry
	 point, other than a panel), we ask extensions there too"
	IceTipRepositoriesBrowser
		buildExtensionCommandsWith: aPresenter
		forRoot: rootCommandGroup.

	^ rootCommandGroup
]

{ #category : 'private' }
IceTipRepositoryGroupPanel >> allListItems [
	
	^ self model repositories
]

{ #category : 'layout' }
IceTipRepositoryGroupPanel >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: repositoryList;
		addLast: repositoryFilter expand: false;
		yourself
]

{ #category : 'transmission' }
IceTipRepositoryGroupPanel >> defaultOutputPort [

	^ self outputSelectionPort
]

{ #category : 'private' }
IceTipRepositoryGroupPanel >> filteredItemsFor: pattern [

	^ self allListItems select: [ :each | 
		  each name asLowercase includesSubstring: pattern asLowercase ]
]

{ #category : 'testing' }
IceTipRepositoryGroupPanel >> hasSelectedItem [
	
	^ repositoryList selectedItem isNotNil
]

{ #category : 'initialization' }
IceTipRepositoryGroupPanel >> initializePresenters [

	repositoryList := self newTable.
	self initializeRepositoryList.
	self initializeRepositoryFilter
]

{ #category : 'initialization' }
IceTipRepositoryGroupPanel >> initializeRepositoryFilter [

	repositoryFilter := self newTextInput.
	repositoryFilter 
		placeholder: 'Filter...';
		whenTextChangedDo: [ :text | self refreshRepositoryList ]
		
]

{ #category : 'initialization' }
IceTipRepositoryGroupPanel >> initializeRepositoryList [

	repositoryList
		showColumnHeaders;
		beResizable;
		addColumn: (SpStringTableColumn new
			title: 'Repositories';
			evaluated: #description;
			displayColor: [ :each | each descriptionDecorator color ];
			displayBold: [ :each | each descriptionDecorator isBold ];
			displayItalic: [ :each | each descriptionDecorator isItalic ];
			width: 200;
			beSortable;
			yourself);
		addColumn: (SpStringTableColumn new
			title: 'Status';
			evaluated: #status;
			displayColor: [ :each | each statusDecorator color ];
			displayBold: [ :each | each statusDecorator isBold ];
			displayItalic: [ :each | each statusDecorator isItalic ];
			width: 200;
			beSortable;
			yourself);
		addColumn: (SpStringTableColumn new
			title: 'Branch';
			evaluated: #branchName;
			yourself);
		contextMenu: [ self selectionCommandsGroup ifNotNil: [ :group | group beRoot asMenuPresenter ] ];
		contextKeyBindings: self keyBindingsCommandsGroup asKMCategory;
		activateOnDoubleClick;
		whenActivatedDo: [ self openManagePackagesWindow ]
]

{ #category : 'private' }
IceTipRepositoryGroupPanel >> isShowingRepository: anIceLibgitRepository [
	"this method is using just for test"
	
	^ repositoryList items anySatisfy: [ :aRepositoryModel | 
		  aRepositoryModel entity = anIceLibgitRepository ]
]

{ #category : 'private' }
IceTipRepositoryGroupPanel >> keyBindingsCommandsGroup [

	^ self rootCommandsGroup
		commandOrGroupNamed: IceTipRepositoriesBrowser selectionCommandGroupName
		ifNone: [ nil ]
]

{ #category : 'actions' }
IceTipRepositoryGroupPanel >> openManagePackagesWindow [

	IceTipManagePackagesCommand new
		context: self;
		execute
]

{ #category : 'transmission' }
IceTipRepositoryGroupPanel >> outputSelectionPort [

	^ (SpSelectionPort newPresenter: self)
		delegateTo: [ repositoryList ];
		yourself
]

{ #category : 'private' }
IceTipRepositoryGroupPanel >> refreshRepositoryList [
	
	repositoryList updateItemsKeepingSelection:  (repositoryFilter text
		ifEmpty: [ self allListItems ]
		ifNotEmpty: [ :pattern | self filteredItemsFor: pattern ])

]

{ #category : 'accessing' }
IceTipRepositoryGroupPanel >> repositoryList [

	^ repositoryList
]

{ #category : 'accessing' }
IceTipRepositoryGroupPanel >> repositoryModel [
	
	^ self selectedItem
]

{ #category : 'accessing' }
IceTipRepositoryGroupPanel >> selectedItem [
	
	^ repositoryList selectedItem
]

{ #category : 'private' }
IceTipRepositoryGroupPanel >> selectionCommandsGroup [ 

	^ self visibleRootCommandsGroup
		commandOrGroupNamed: IceTipRepositoriesBrowser selectionCommandGroupName
		ifNone: [ nil ]
]

{ #category : 'initialization' }
IceTipRepositoryGroupPanel >> updatePresenter [

	self refreshRepositoryList
]

{ #category : 'private' }
IceTipRepositoryGroupPanel >> visibleRootCommandsGroup [
	| rootGroup |	
		
	rootGroup := self rootCommandsGroup.
	IceTipCleanCommandGroupVisitor new visit: rootGroup.
	^ rootGroup
]

{ #category : 'accessing' }
IceTipRepositoryGroupPanel >> workingCopyModel [
	
	^ self selectedItem workingCopyModel
]
