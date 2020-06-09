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
		'messagePanel',
		'addDirectoryButton',
		'removeDirectoryButton'
	],
	#category : #'Iceberg-TipUI-View-Project'
}

{ #category : #specs }
IceTipEditProjectDialog class >> defaultSpec [
	<spec: #default>
	^ SpecLayout composed
		newColumn: [ :col | 
			col
				newRow: [ :row | 
					row
						newColumn: #nameLabel width: self iceLabelWidth;
						newColumn: #nameInput ;
						newColumn: #addDirectoryButton width: (self iconNamed: #add) width + 10;
						newColumn: #removeDirectoryButton width: (self iconNamed: #remove) width + 10]
					height: self inputTextHeight;
				newRow: [ :row | 
					row
						newColumn: [ :column |
							column
								add: #sourceDirectoryLabel height: self inputTextHeight;
								newRow: [ :emptyRow | "Fill space"  ] ] width: self iceLabelWidth;
						newColumn: #sourceDirectoryTree ]
					height: 200 * self currentWorld displayScaleFactor;
				newRow: [ :row | 
					row
						newColumn: #formatLabel width: self iceLabelWidth;
						newColumn: #formatList ]
					height: self inputTextHeight;
				newRow: [ :row | 
					row newColumn: [ :emptyCol ] width: self iceLabelWidth - 40.
					row add: #messagePanel ];	
				newRow: [ :emptyRow | "Fill space" ] height: 1 ]
]

{ #category : #specs }
IceTipEditProjectDialog class >> title [
	^ 'Edit Project'
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

	self window delete.
	acceptCallback ifNotNil: [ 
		acceptCallback value ].
]

{ #category : #accessing }
IceTipEditProjectDialog >> acceptCallback [
	^ acceptCallback
]

{ #category : #actions }
IceTipEditProjectDialog >> addDirectory [

	| newDirectoryName newDirectory |
	
	newDirectoryName := UIManager default
		textEntry: 'Enter the new Directory name'
		title: 'Create a directory'.
	
	newDirectoryName ifNil: [ ^ self ].
	
	newDirectory := (selectedDirectoryPath / newDirectoryName) asResolvedBy: self model fileSystem. 
	
	newDirectory exists 
		ifFalse: [ newDirectory createDirectory ].
	
	"The FTTable lost the selection when the expansion is done"
	sourceDirectoryTree widget dataSource updateData.
	sourceDirectoryTree widget dataSource expandAll.
	sourceDirectoryTree widget selectIndex: (sourceDirectoryTree widget dataSource indexOfElement: (selectedDirectoryPath asResolvedBy: self model fileSystem)).

]

{ #category : #accessing }
IceTipEditProjectDialog >> addDirectoryButton [
	^ addDirectoryButton
]

{ #category : #initialization }
IceTipEditProjectDialog >> defaultFormat [

	^ defaultFormat
]

{ #category : #accessing }
IceTipEditProjectDialog >> formatLabel [
	^ formatLabel
]

{ #category : #accessing }
IceTipEditProjectDialog >> formatLabel: anObject [
	formatLabel := anObject
]

{ #category : #accessing }
IceTipEditProjectDialog >> formatList [
	^ formatList
]

{ #category : #accessing }
IceTipEditProjectDialog >> formatList: anObject [
	formatList := anObject
]

{ #category : #initialization }
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

{ #category : #initialization }
IceTipEditProjectDialog >> hasToShowWarning [

	^ model repository workingCopy packages isNotEmpty
]

{ #category : #api }
IceTipEditProjectDialog >> initialExtent [

	^ 
	self hasToShowWarning 
		ifTrue: [ (475@500) scaledByDisplayScaleFactor ]
		ifFalse: [  
			(475@(
				200 "Tree"
				+ (self class inputTextHeight * 3)
				+ self class buttonHeight 
				+ 50 "Yes, a magic number"
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
	| dataSource |
	dataSource := self newDirectoryDataSource.
	sourceDirectoryTree widget
		addColumn:
			(IceTipTableColumn
				newAction: #name
				icon: [ :each | self iconNamed: #package ]);
		dataSource: dataSource;
		onAnnouncement: FTSelectionChanged
			do:
				[ :announcement | self sourceDirectorySelectionChanged: announcement newSelectedIndexes ]
]

{ #category : #initialization }
IceTipEditProjectDialog >> initializeMessagePanel [

	self hasToShowWarning
		ifTrue: [ 
			messagePanel := self instantiate: IceTipReadOnlyTextMorphWithIcon.
			messagePanel iconName: #warning.
			messagePanel text: self warningMessage  ]
		ifFalse: [ 
			messagePanel := self newIcePanel.
			messagePanel widget height: 1 ].

]

{ #category : #initialization }
IceTipEditProjectDialog >> initializePresenter [
	| path currentNode |
	super initializePresenter.
	self formatList
		items: self formats;
		displayBlock: [ :each | each description ];
		setSelectedItem: model repositoryProperties fileFormat.
	path := (RelativePath with: model sourceDirectory) segments
		asOrderedCollection.
	currentNode := self sourceDirectoryTree widget dataSource rootItem
		children first.
	currentNode expand.
	[ path isEmpty ]
		whileFalse: [ | currentSegment |
			currentSegment := path removeFirst.
			currentNode := currentNode children
				detect: [ :e | (e data basename ifEmpty: [ '/' ]) = currentSegment ]
				ifFound: [ :node | 
					node expand.
					node ]
				ifNone: [ nil ] ].
	currentNode
		ifNotNil: [ | index |
			index := self sourceDirectoryTree widget dataSource
				indexOfElementMatching: [ :elem | elem = currentNode data ].
			self sourceDirectoryTree widget selectIndex: index ]
]

{ #category : #initialization }
IceTipEditProjectDialog >> initializeWidgets [
	nameLabel := self newLabel label: 'Project Name'.
	nameInput := self newLabel label: self model name.
	
	sourceDirectoryLabel := self newLabel
		label: 'Code directory';
		yourself.
	sourceDirectoryTree := self newIceTreeTable.
	
	formatLabel := self newLabel label: 'Format'.
	formatList := self newDropList.
	
	addDirectoryButton := self newButton
		label: '';
		help: 'Create a new directory under the selected one';
		iconName: #add;
		enabled: false;
		action: [ self addDirectory ];
		yourself.

	removeDirectoryButton := self newButton
		label: '';
		help: 'Removes the selected directory';
		iconName: #remove;
		enabled: false;
		action: [ self removeDirectory ];
		yourself.

	self initializeMessagePanel.

	self initializeDirectoryTree.
	self focusOrder
		add: nameInput;
		add: sourceDirectoryTree;
		add: formatList
]

{ #category : #initialization }
IceTipEditProjectDialog >> messagePanel [

	^ messagePanel
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
IceTipEditProjectDialog >> nameInput: anObject [
	nameInput := anObject
]

{ #category : #'accessing ui' }
IceTipEditProjectDialog >> nameLabel [
	^ nameLabel
]

{ #category : #'accessing ui' }
IceTipEditProjectDialog >> nameLabel: anObject [
	nameLabel := anObject
]

{ #category : #initialization }
IceTipEditProjectDialog >> newDirectoryDataSource [

	^ IceTipDirectoryDataSource new
		tool: self;
		directory: self model fileSystem;
		yourself
]

{ #category : #events }
IceTipEditProjectDialog >> onAccept: aBlockClosure [ 
	
	acceptCallback := aBlockClosure
]

{ #category : #actions }
IceTipEditProjectDialog >> removeDirectory [

	| toRemove |
	
	toRemove := selectedDirectoryPath asResolvedBy: self model fileSystem.

	toRemove exists 
		ifTrue: [ 
			(UIManager default 
				questionWithoutCancel: ('Are you sure to delete ''{1}''?' format: {toRemove basename})  
				title: 'Remove directory')
				ifFalse: [ ^ self].
			toRemove ensureDelete ].
	
	"The FTTable lost the selection when the expansion is done"
	sourceDirectoryTree widget dataSource updateData.
	sourceDirectoryTree widget dataSource expandAll.
	sourceDirectoryTree widget selectIndex: (sourceDirectoryTree widget dataSource indexOfElement: toRemove parent).

]

{ #category : #accessing }
IceTipEditProjectDialog >> removeDirectoryButton [
	
	^ removeDirectoryButton
]

{ #category : #initialization }
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

{ #category : #accessing }
IceTipEditProjectDialog >> sourceDirectoryLabel [
	^ sourceDirectoryLabel
]

{ #category : #accessing }
IceTipEditProjectDialog >> sourceDirectoryLabel: anObject [
	sourceDirectoryLabel := anObject
]

{ #category : #initialization }
IceTipEditProjectDialog >> sourceDirectorySelectionChanged: selectedIndexes [

	| selectedDirectory selection |
	selectedIndexes
		ifEmpty: [ 
			"If the user does not select any directory, we choose the root and we use the default format"
			selectedDirectoryPath := RelativePath new.
			self sourceDirectoryTree widget selectRowIndex: 1.
			selection := self sourceDirectoryTree widget dataSource rootItem children first.
			selectedDirectory := self sourceDirectoryTree widget dataSource rootItem children first data.
		] ifNotEmpty: [
			[selection := self sourceDirectoryTree widget dataSource elementAt: selectedIndexes first] 
				on:SubscriptOutOfBounds do:[ ^ self ].
		].
	
	selectedDirectory := selection data.
	selectedDirectoryPath := selectedDirectory relativeTo: self model fileSystem. 
	formatList setSelectedItem: (self guessFormatFromDirectory: selectedDirectory).
	
	self updateRemoveAndAddButton.
]

{ #category : #accessing }
IceTipEditProjectDialog >> sourceDirectoryTree [
	^ sourceDirectoryTree
]

{ #category : #accessing }
IceTipEditProjectDialog >> sourceDirectoryTree: anObject [
	sourceDirectoryTree := anObject
]

{ #category : #events }
IceTipEditProjectDialog >> updateRemoveAndAddButton [

	addDirectoryButton enabled: selectedDirectoryPath isNotNil.
	removeDirectoryButton enabled: selectedDirectoryPath isWorkingDirectory not
]

{ #category : #accessing }
IceTipEditProjectDialog >> username [
	^ self nameInput text trimBoth
]

{ #category : #initialization }
IceTipEditProjectDialog >> warningMessage [

	^ 'Be careful. You should choose the actual format of the current repository.
Changing the format in here will not migrate your code to another format.

If you want to migrate your code from Filetree to Tonel, use the migration option in the context menu (Extra >> Convert repository sources to Tonel).'
]
