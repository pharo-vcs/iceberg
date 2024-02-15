Class {
	#name : 'IceTipEditProjectDialogPresenter',
	#superclass : 'IceTipDialogPresenter',
	#instVars : [
		'nameLabel',
		'nameInput',
		'model',
		'acceptCallback',
		'sourceDirectoryLabel',
		'sourceDirectoryTree',
		'selectedDirectoryPath',
		'formatList',
		'formatLabel',
		'formats',
		'defaultFormat',
		'messageIcon',
		'messageText',
		'removeButton',
		'addButton'
	],
	#category : 'Iceberg-TipUI-View-Repository',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Repository'
}

{ #category : 'actions' }
IceTipEditProjectDialogPresenter >> accept [

	IceTipStandardAction new
		repository: model repository;
		message: 'Setting up project';
		onSuccessRepositoryModified;
		action: [
			"Update the project"
			model sourceDirectory: self selectedDirectoryPath pathString.
			model fileFormat: self selectedFileFormat.
			(model repositoryProperties fileFormat = self selectedFileFormat)
				ifFalse: [ self error: 'Selected file format is incorrect.' ].
			"Set the project in the repository"
			model repository workingCopy project: model ];
		executeWithContext: self.

	self closeWindow.
	acceptCallback ifNotNil: [
		acceptCallback value ]
]

{ #category : 'accessing' }
IceTipEditProjectDialogPresenter >> acceptCallback [

	^ acceptCallback
]

{ #category : 'actions' }
IceTipEditProjectDialogPresenter >> addDirectory [

	| newDirectoryName newDirectory previousSelection |
	
	newDirectoryName := self application newRequest
		title: 'Create a directory';
		label: 'Enter the new Directory name';
		openModalWithParent: self window.
	newDirectoryName ifNil: [ ^ self ].
	
	previousSelection := selectedDirectoryPath.
	newDirectory := (previousSelection / newDirectoryName) asResolvedBy: self model fileSystem. 
	
	newDirectory exists 
		ifFalse: [ newDirectory createDirectory ].
	
	sourceDirectoryTree roots: { self model fileSystem }.
	self expandAndSelect: previousSelection
]

{ #category : 'initialization' }
IceTipEditProjectDialogPresenter >> connectPresenters [

	super connectPresenters.

	removeButton action: [ self removeDirectory ].
	addButton action: [ self addDirectory ].

	self formatList
		items: self formats;
		display: [ :each | each description ];
		selectItem: (self guessFormatFromDirectory: model sourceDirectoryReference).

	self expandAndSelect: (RelativePath with: model sourceDirectory).

]

{ #category : 'accessing' }
IceTipEditProjectDialogPresenter >> defaultFormat [

	^ defaultFormat
]

{ #category : 'layout' }
IceTipEditProjectDialogPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		borderWidth: 5;
		spacing: 5;
		add: (SpBoxLayout newLeftToRight
				spacing: 5;
				vAlignCenter;
				add: nameLabel expand: false;
				add: nameInput;
				add: addButton expand: false;
				add: removeButton expand: false;
				yourself)
		  	expand: false;
		add: (SpBoxLayout newLeftToRight
				spacing: 5;
				add: sourceDirectoryLabel expand: false;
				add: sourceDirectoryTree;
				yourself);
		add: (SpBoxLayout newLeftToRight
				vAlignCenter;
				spacing: 5;
				add: formatLabel expand: false;
				add: formatList;
				yourself)
			expand: false;
		add: (SpBoxLayout newLeftToRight
				spacing: 5;
				add: messageIcon expand: false;
				add: messageText;
				yourself);
		yourself
]

{ #category : 'utilities' }
IceTipEditProjectDialogPresenter >> expandAndSelect: aRelativePath [ 

	
	| path aPathForSpec currentNode |
	path := aRelativePath segments	asOrderedCollection.
	
	aPathForSpec := OrderedCollection new.
	aPathForSpec add: 1.
	
	currentNode := self model fileSystem.
	
	path do: [ :aPart | | found |
		found := currentNode directories detect: [ :e | e basename = aPart ] ifNone: [ ^self ].
		aPathForSpec add: (currentNode directories indexOf: found).
		currentNode := found].
	
	sourceDirectoryTree expandPath: aPathForSpec.

	sourceDirectoryTree withAdapterPerformOrDefer: [ :anAdapter |
		sourceDirectoryTree selectPaths: { aPathForSpec } ].
	
	


]

{ #category : 'accessing - ui' }
IceTipEditProjectDialogPresenter >> formatLabel [

	^ formatLabel
]

{ #category : 'accessing - ui' }
IceTipEditProjectDialogPresenter >> formatList [

	^ formatList
]

{ #category : 'accessing' }
IceTipEditProjectDialogPresenter >> formats [

	^ formats
]

{ #category : 'format-management' }
IceTipEditProjectDialogPresenter >> guessFormatFromDirectory: aFileReference [ 
	
	"We take as guinea pig a sub-directory to guess what format it is on.
	In case the current directory has no children directories, we just select the default format"
	| guineaPig |
	aFileReference exists ifFalse: [ ^ defaultFormat ].
	
	guineaPig := aFileReference children detect: [ :any | any isDirectory ] ifNone: [ ^ defaultFormat ].
	
	"Filetree must have precedence as it has the most restrictive name convention (directories ending with .package)"
	((formats includes: IceLibgitFiletreeWriter)
		and: [ IceLibgitFiletreeWriter isValidPackage: guineaPig ])
			ifTrue: [ ^ IceLibgitFiletreeWriter ].
	
	"Otherwise go with the entire list"
	^ formats
		detect: [ :each | each isValidPackage: guineaPig ]
		ifNone: [ ^ defaultFormat ].
]

{ #category : 'accessing' }
IceTipEditProjectDialogPresenter >> hasToShowWarning [

	^ model repository workingCopy packages isNotEmpty
]

{ #category : 'initialization' }
IceTipEditProjectDialogPresenter >> initialExtentForWindow [

	^ self hasToShowWarning 
		ifTrue: [ (475@525) scaledByDisplayScaleFactor ]
		ifFalse: [  
			(475@(
				200 "Tree"
				+ (self class inputTextHeight * 3)
				+ self class buttonHeight 
				+ 75 "Yes, a magic number"
			)) scaledByDisplayScaleFactor]

]

{ #category : 'initialization' }
IceTipEditProjectDialogPresenter >> initialize [

	selectedDirectoryPath := RelativePath new.
	formats := TIceRepositoryWriter users sorted: [ :a :b | a description < b description ].
	defaultFormat := IceLibgitRepository defaultFileFormat.
	
	super initialize.
]

{ #category : 'initialization' }
IceTipEditProjectDialogPresenter >> initializeDirectoryTree [

	sourceDirectoryTree
		addColumn: (SpCompositeTableColumn new
				 addColumn: (SpImageTableColumn new
						  width: 20;
						  evaluated: [ self iconNamed: #package ];
						  yourself);
				 addColumn: (SpStringTableColumn new
						  evaluated: #basename;
						  yourself));
		roots: { self model fileSystem };
		children: [ :each | each directories ];
		whenSelectionChangedDo: [ :announcement | 
			self sourceDirectorySelectionChanged: announcement selectedPaths ]
]

{ #category : 'initialization' }
IceTipEditProjectDialogPresenter >> initializeMessagePanel [

	| icon |

	self hasToShowWarning ifTrue: [ 
		icon := self iconNamed: #warning.
		icon := icon scaledToSize: (icon extent * 2).

		messageIcon image: icon .
		messageText text: self warningMessage ]
]

{ #category : 'initialization' }
IceTipEditProjectDialogPresenter >> initializePresenters [

	nameLabel := self newLabel
		label: 'Project Name';
		yourself.
	nameInput := self newLabel
		label: self model name;
		yourself.
	sourceDirectoryLabel := self newLabel
		label: 'Code directory';
		yourself.
	sourceDirectoryTree := self newTreeTable
		hideColumnHeaders;
		yourself.
	formatLabel := self newLabel
		label: 'Format';
		yourself.
	formatList := self newDropList.
	messageIcon := self newImage.
	messageText := self newText
		beNotEditable;
		addStyle: 'iceTipReadonly';
		yourself.

	removeButton := self newButton 
		addStyle: 'small';
		icon: (self iconNamed: #remove); 
		yourself.
	addButton := self newButton 
		addStyle: 'small';
		icon: (self iconNamed: #add); 
		yourself.

	self initializeMessagePanel.
	self initializeDirectoryTree
]

{ #category : 'accessing' }
IceTipEditProjectDialogPresenter >> messageIcon [

	^ messageIcon
]

{ #category : 'accessing' }
IceTipEditProjectDialogPresenter >> messageText [ 

	^ messageText 
]

{ #category : 'accessing' }
IceTipEditProjectDialogPresenter >> model [

	^ model
]

{ #category : 'accessing - ui' }
IceTipEditProjectDialogPresenter >> nameInput [

	^ nameInput
]

{ #category : 'accessing - ui' }
IceTipEditProjectDialogPresenter >> nameLabel [

	^ nameLabel
]

{ #category : 'events' }
IceTipEditProjectDialogPresenter >> onAccept: aBlockClosure [ 
	
	acceptCallback := aBlockClosure
]

{ #category : 'actions' }
IceTipEditProjectDialogPresenter >> removeDirectory [

	| toRemove newSelection |
	newSelection := selectedDirectoryPath parent.
	toRemove := selectedDirectoryPath asResolvedBy: self model fileSystem.

	toRemove exists ifTrue: [
		(self application newConfirm
			 title: 'Remove directory';
			 label: ('Are you sure to delete ''{1}''?' format: { toRemove basename });
			 openModal) ifFalse: [ ^ self ].
		toRemove ensureDelete ].

	sourceDirectoryTree roots: { self model fileSystem }.
	self expandAndSelect: newSelection
]

{ #category : 'accessing' }
IceTipEditProjectDialogPresenter >> selectedDirectoryPath [

	^ selectedDirectoryPath
]

{ #category : 'actions' }
IceTipEditProjectDialogPresenter >> selectedFileFormat [
	
	^ formatList selectedItem
]

{ #category : 'events' }
IceTipEditProjectDialogPresenter >> setModelBeforeInitialization: anObject [

	model := anObject
]

{ #category : 'accessing - ui' }
IceTipEditProjectDialogPresenter >> sourceDirectoryLabel [

	^ sourceDirectoryLabel
]

{ #category : 'accessing' }
IceTipEditProjectDialogPresenter >> sourceDirectorySelectionChanged: selectedPaths [

	| selection |

	selectedPaths
		ifEmpty:
			[ "If the user does not select any directory, we choose the root and we use the default format"
			selectedDirectoryPath := RelativePath new.
			selection := self sourceDirectoryTree roots first ]
		ifNotEmpty: [ selection := self sourceDirectoryTree
				itemAtPath: selectedPaths first. ].
	formatList selectItem: (self guessFormatFromDirectory: selection).
	selectedDirectoryPath := selection relativeTo: self model fileSystem. 
]

{ #category : 'accessing - ui' }
IceTipEditProjectDialogPresenter >> sourceDirectoryTree [

	^ sourceDirectoryTree
]

{ #category : 'initialization' }
IceTipEditProjectDialogPresenter >> titleForWindow [

	^ 'Edit Project'
]

{ #category : 'accessing' }
IceTipEditProjectDialogPresenter >> username [

	^ self nameInput text trimBoth
]

{ #category : 'accessing' }
IceTipEditProjectDialogPresenter >> warningMessage [

	^ 'Be careful. You should choose the actual format of the current repository.
Changing the format in here will not migrate your code to another format.

If you want to migrate your code from Filetree to Tonel, use the migration option in the context menu (Extra >> Convert repository sources to Tonel).'
]
