Class {
	#name : #IceTipEditProjectDialog,
	#superclass : #IceTipDialog,
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
	#category : #'Iceberg-TipUI-View-Repository'
}

{ #category : #actions }
IceTipEditProjectDialog >> accept [	
	
	IceTipStandardAction new
		repository: model repository;
		message: 'Setting up project';
		onSuccessRepositoryModified;
		action: [ 
			"Update the project"
			model sourceDirectory: self selectedDirectoryPath pathString.
			model fileFormat: self selectedFileFormat.
			self assert: model repositoryProperties fileFormat = self selectedFileFormat.
			"Set the project in the repository"
			model repository workingCopy project: model ];
		executeWithContext: self.

	self closeWindow.
	acceptCallback ifNotNil: [ 
		acceptCallback value ]
]

{ #category : #accessing }
IceTipEditProjectDialog >> acceptCallback [

	^ acceptCallback
]

{ #category : #actions }
IceTipEditProjectDialog >> addDirectory [

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

{ #category : #initialization }
IceTipEditProjectDialog >> connectPresenters [

	super connectPresenters.

	removeButton action: [ self removeDirectory ].
	addButton action: [ self addDirectory ].

	self formatList
		items: self formats;
		display: [ :each | each description ];
		selectItem: model repositoryProperties fileFormat.

	self expandAndSelect: (RelativePath with: model sourceDirectory).

]

{ #category : #accessing }
IceTipEditProjectDialog >> defaultFormat [

	^ defaultFormat
]

{ #category : #layout }
IceTipEditProjectDialog >> defaultLayout [

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

{ #category : #utilities }
IceTipEditProjectDialog >> expandAndSelect: aRelativePath [ 

	
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

{ #category : #'accessing - ui' }
IceTipEditProjectDialog >> formatLabel [

	^ formatLabel
]

{ #category : #'accessing - ui' }
IceTipEditProjectDialog >> formatList [

	^ formatList
]

{ #category : #accessing }
IceTipEditProjectDialog >> formats [

	^ formats
]

{ #category : #'format-management' }
IceTipEditProjectDialog >> guessFormatFromDirectory: aFileReference [ 
	
	"We take as guinea pig a sub-directory to guess what format it is on.
	In case the current directory has no children directories, we just select the default format"
	| guineaPig |
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

{ #category : #accessing }
IceTipEditProjectDialog >> hasToShowWarning [

	^ model repository workingCopy packages isNotEmpty
]

{ #category : #initialization }
IceTipEditProjectDialog >> initialExtentForWindow [

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

{ #category : #initialization }
IceTipEditProjectDialog >> initialize [

	selectedDirectoryPath := RelativePath new.
	formats := TIceRepositoryWriter users sorted: [ :a :b | a description < b description ].
	defaultFormat := IceLibgitRepository defaultFileFormat.
	
	super initialize.
]

{ #category : #initialization }
IceTipEditProjectDialog >> initializeDirectoryTree [

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

{ #category : #initialization }
IceTipEditProjectDialog >> initializeMessagePanel [

	| icon |

	self hasToShowWarning ifTrue: [ 
		icon := self iconNamed: #warning.
		icon := icon scaledToSize: (icon extent * 2).

		messageIcon image: icon .
		messageText text: self warningMessage ]
]

{ #category : #initialization }
IceTipEditProjectDialog >> initializePresenters [

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

{ #category : #accessing }
IceTipEditProjectDialog >> messageIcon [

	^ messageIcon
]

{ #category : #accessing }
IceTipEditProjectDialog >> messageText [ 

	^ messageText 
]

{ #category : #accessing }
IceTipEditProjectDialog >> model [

	^ model
]

{ #category : #'accessing - ui' }
IceTipEditProjectDialog >> nameInput [

	^ nameInput
]

{ #category : #'accessing - ui' }
IceTipEditProjectDialog >> nameLabel [

	^ nameLabel
]

{ #category : #events }
IceTipEditProjectDialog >> onAccept: aBlockClosure [ 
	
	acceptCallback := aBlockClosure
]

{ #category : #actions }
IceTipEditProjectDialog >> removeDirectory [

	| toRemove newSelection |
	
	newSelection := selectedDirectoryPath parent.
	toRemove := selectedDirectoryPath asResolvedBy: self model fileSystem.

	toRemove exists 
		ifTrue: [ 
			(UIManager default 
				questionWithoutCancel: ('Are you sure to delete ''{1}''?' format: {toRemove basename})  
				title: 'Remove directory')
				ifFalse: [ ^ self].
			toRemove ensureDelete ].
		
	sourceDirectoryTree roots: { self model fileSystem }.
	self expandAndSelect: newSelection.

]

{ #category : #accessing }
IceTipEditProjectDialog >> selectedDirectoryPath [

	^ selectedDirectoryPath
]

{ #category : #actions }
IceTipEditProjectDialog >> selectedFileFormat [
	
	^ formatList selectedItem
]

{ #category : #events }
IceTipEditProjectDialog >> setModelBeforeInitialization: anObject [

	model := anObject
]

{ #category : #'accessing - ui' }
IceTipEditProjectDialog >> sourceDirectoryLabel [

	^ sourceDirectoryLabel
]

{ #category : #accessing }
IceTipEditProjectDialog >> sourceDirectorySelectionChanged: selectedPaths [

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

{ #category : #'accessing - ui' }
IceTipEditProjectDialog >> sourceDirectoryTree [

	^ sourceDirectoryTree
]

{ #category : #initialization }
IceTipEditProjectDialog >> titleForWindow [

	^ 'Edit Project'
]

{ #category : #accessing }
IceTipEditProjectDialog >> username [

	^ self nameInput text trimBoth
]

{ #category : #accessing }
IceTipEditProjectDialog >> warningMessage [

	^ 'Be careful. You should choose the actual format of the current repository.
Changing the format in here will not migrate your code to another format.

If you want to migrate your code from Filetree to Tonel, use the migration option in the context menu (Extra >> Convert repository sources to Tonel).'
]
