Class {
	#name : #IceTipRepositoryGroupPanel,
	#superclass : #SpPresenter,
	#traits : 'SpTModel',
	#classTraits : 'SpTModel classTrait',
	#instVars : [
		'repositoryList'
	],
	#category : #'Iceberg-TipUI-View-Repository'
}

{ #category : #commands }
IceTipRepositoryGroupPanel class >> buildCommandsGroupWith: presenter forRoot: aCommandGroup [

	self flag: #HACK. "I extracted this panel from IceTipRepositoriesBrowser, 
	but I do not want to extract all the machinery that is it in (which is a mess)
	so for now, until I get time to refactor all that, I am just pointing there"
	^ IceTipRepositoriesBrowser 
		buildCommandsGroupWith: presenter 
		forRoot: aCommandGroup
]

{ #category : #layout }
IceTipRepositoryGroupPanel >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: repositoryList;
		yourself
]

{ #category : #transmission }
IceTipRepositoryGroupPanel >> defaultOutputPort [

	^ self outputSelectionPort
]

{ #category : #testing }
IceTipRepositoryGroupPanel >> hasSelectedItem [
	
	^ repositoryList selectedItem notNil
]

{ #category : #initialization }
IceTipRepositoryGroupPanel >> initializePresenter [

	repositoryList := self newTable.
	self initializeRepositoryList
]

{ #category : #initialization }
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
		contextMenu: [ self selectionCommandsGroup beRoot asMenuPresenter ];
		activateOnDoubleClick;
		whenActivatedDo: [ self openManagePackagesWindow ]
]

{ #category : #actions }
IceTipRepositoryGroupPanel >> openManagePackagesWindow [

	IceTipManagePackagesCommand new
		context: self;
		execute
]

{ #category : #transmission }
IceTipRepositoryGroupPanel >> outputSelectionPort [

	^ (SpSelectionPort newPresenter: self)
		delegateTo: [ repositoryList ];
		yourself
]

{ #category : #accessing }
IceTipRepositoryGroupPanel >> repositoryList [

	^ repositoryList
]

{ #category : #accessing }
IceTipRepositoryGroupPanel >> repositoryModel [
	
	^ self selectedItem
]

{ #category : #accessing }
IceTipRepositoryGroupPanel >> selectedItem [
	
	^ repositoryList selectedItem
]

{ #category : #private }
IceTipRepositoryGroupPanel >> selectionCommandsGroup [ 

	^ self visibleRootCommandsGroup
		commandOrGroupNamed: IceTipRepositoriesBrowser selectionCommandGroupName
		ifNone: [ nil ]
]

{ #category : #initialization }
IceTipRepositoryGroupPanel >> updatePresenter [

	repositoryList updateItemsKeepingSelection: self model repositories
]

{ #category : #private }
IceTipRepositoryGroupPanel >> visibleRootCommandsGroup [
	| rootGroup |	
		
	rootGroup := self rootCommandsGroup.
	IceTipCleanCommandGroupVisitor new visit: rootGroup.
	^ rootGroup
]
