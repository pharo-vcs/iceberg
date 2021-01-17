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
		'messageText'
	],
	#category : #'Iceberg-TipUI-View-Project'
}

{ #category : #specs }
IceTipEditProjectDialog class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: (SpBoxLayout newHorizontal
				   add: #nameLabel width: self labelWidth;
				   add: #nameInput;
				   yourself)
		  height: self inputTextHeight;
		  add: (SpBoxLayout newHorizontal
				   add: #sourceDirectoryLabel width: self labelWidth;
				   add: #sourceDirectoryTree;
				   yourself)
		  height: 200 * self currentWorld displayScaleFactor;
		  add: (SpBoxLayout newHorizontal
				   add: #formatLabel width: self labelWidth;
				   add: #formatList;
				   yourself)
		  height: self inputTextHeight;
		  add: (SpBoxLayout newHorizontal
				   add: #messageIcon width: self labelWidth;
				   add: #messageText;
				   yourself);
		  yourself
]

{ #category : #actions }
IceTipEditProjectDialog >> accept [	
	
	IceTipStandardAction new 
		repository: model repository;
		message: 'Setting up project';
		onSuccessRepositoryModified;
		execute: [ 
			"Update the project"
			model sourceDirectory: self selectedDirectoryPath pathString.
			model fileFormat: self selectedFileFormat.
			self assert: model repositoryProperties fileFormat = self selectedFileFormat.
			"Set the project in the repository"
			model repository workingCopy project: model ].

	self closeWindow.
	acceptCallback ifNotNil: [ 
		acceptCallback value ].
]

{ #category : #accessing }
IceTipEditProjectDialog >> acceptCallback [

	^ acceptCallback
]

{ #category : #initialization }
IceTipEditProjectDialog >> connectPresenters [

	| path currentNode |
	super connectPresenters.
	self formatList
		items: self formats;
		display: [ :each | each description ];
		selectItem: model repositoryProperties fileFormat.
	path := (RelativePath with: model sourceDirectory) segments
		asOrderedCollection.
	currentNode := self sourceDirectoryTree roots first children first.
	"	currentNode expand.
	[ path isEmpty ]
		whileFalse: [ | currentSegment |
			currentSegment := path removeFirst.
			currentNode := currentNode children
				detect: [ :e | (e data basename ifEmpty: [ '/' ]) = currentSegment ]
				ifFound: [ :node | 
					node expand.
					node ]
				ifNone: [ nil ] ]

	currentNode
		ifNotNil: [ | index |
			index := self sourceDirectoryTree widget dataSource indexOfElementMatching: [ :elem | elem = currentNode data ].
			self sourceDirectoryTree widget selectRowIndex: index ]."
]

{ #category : #accessing }
IceTipEditProjectDialog >> defaultFormat [

	^ defaultFormat
]

{ #category : #'accessing ui' }
IceTipEditProjectDialog >> formatLabel [

	^ formatLabel
]

{ #category : #'accessing ui' }
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

	self hasToShowWarning ifTrue: [ 
		messageIcon image: (self iconNamed: #warning).
		messageText text: self warningMessage ]
]

{ #category : #initialization }
IceTipEditProjectDialog >> initializePresenters [

	super initializePresenters.
	nameLabel := self newLabel
		label: 'Project Name';
		yourself.
	nameInput := self newLabel
		label: self model name;
		yourself.
	sourceDirectoryLabel := self newLabel
		label: 'Code directory';
		yourself.
	sourceDirectoryTree := self newTreeTable.
	formatLabel := self newLabel
		label: 'Format';
		yourself.
	formatList := self newDropList.
	messageIcon := self newImage.
	messageText := self newText
		beNotEditable;
		yourself.

	self initializeMessagePanel.
	self initializeDirectoryTree.

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

{ #category : #'accessing ui' }
IceTipEditProjectDialog >> nameInput [

	^ nameInput
]

{ #category : #'accessing ui' }
IceTipEditProjectDialog >> nameLabel [

	^ nameLabel
]

{ #category : #events }
IceTipEditProjectDialog >> onAccept: aBlockClosure [ 
	
	acceptCallback := aBlockClosure
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

{ #category : #'accessing ui' }
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

{ #category : #'accessing ui' }
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
