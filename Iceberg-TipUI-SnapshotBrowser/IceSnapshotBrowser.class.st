"
I am a browser to be able to browse the code of a Monticello snapshot. 

I am made with the Spec framework.
"
Class {
	#name : 'IceSnapshotBrowser',
	#superclass : 'StPresenter',
	#instVars : [
		'srcCodePresenter',
		'classesPresenter',
		'protocolsPresenter',
		'methodsPresenter',
		'items',
		'classOrInstanceSelectorPresenter',
		'categoriesPresenter',
		'commentPresenter',
		'classDefinitionPresenter',
		'titleString'
	],
	#category : 'Iceberg-TipUI-SnapshotBrowser',
	#package : 'Iceberg-TipUI-SnapshotBrowser'
}

{ #category : 'commands' }
IceSnapshotBrowser class >> buildCommandsGroupWith: presenterInstance forRoot: rootCommandGroup [

	super
		buildCommandsGroupWith: presenterInstance
		forRoot: rootCommandGroup.
	rootCommandGroup 
		"Package category commands"
		register: ((CmCommandGroup named: 'MCCategorySelContextualMenu') asSpecGroup
					  register: ((IceSBLoadCategoryCommand
							    forSpecWithIconNamed: #smallLoadProject
							    shortcutKey: 'K' asShortcut) context: presenterInstance);
					  beDisplayedAsGroup;
					  yourself);

		"Class commands"
		register: ((CmCommandGroup named: 'MCClassSelContextualMenu') asSpecGroup
					  register: ((IceSBLoadClassCommand
							    forSpecWithIconNamed: #smallLoadProject
							    shortcutKey: 'C' asShortcut) context: presenterInstance);
					  register: ((IceSBBrowseFullClassCommand
							    forSpecWithIconNamed: #browse
							    shortcutKey: 'B' asShortcut) context: presenterInstance);
					  register: ((IceSBBrowseHierarchyClassCommand
							    forSpecWithIconNamed: #smallHierarchyBrowser
							    shortcutKey: 'H' asShortcut) context: presenterInstance);
					  beDisplayedAsGroup;
					  yourself);

		"Protocol commands"
		register: ((CmCommandGroup named: 'MCProtocolsSelContextualMenu') asSpecGroup
					  register: ((IceSBLoadProtocolCommand
							    forSpecWithIconNamed: #smallLoadProject
							    shortcutKey: 'P' asShortcut) context: presenterInstance);
					  beDisplayedAsGroup;
					  yourself);

		"Method commands"
		register: ((CmCommandGroup named: 'MCMethodsSelContextualMenu') asSpecGroup
					  register: ((IceSBLoadMethodCommand
							    forSpecWithIconNamed: #smallLoadProject
							    shortcutKey: 'B' asShortcut) context: presenterInstance);
					  register: ((IceSBBrowseFullMethodCommand
							    forSpecWithIconNamed: #browse
							    shortcutKey: 'M' asShortcut) context: presenterInstance);
					  register: ((IceSBBrowseHierarchyMethodCommand
							    forSpecWithIconNamed: #smallHierarchyBrowser 
							    shortcutKey: 'Y' asShortcut) context: presenterInstance);
					  register: ((IceSBBrowseMethodImplementorsCommand
							    forSpecWithIconNamed: #browseMethodImplementors
							    shortcutKey: 'T' asShortcut) context: presenterInstance);
					  register: ((IceSBBrowseMethodInheritanceCommand
							    forSpecWithIconNamed: #browseMethodInheritance
							    shortcutKey: 'E' asShortcut) context: presenterInstance);
					  register: ((IceSBBrowseMethodVersionsCommand
							    forSpecWithIconNamed: #versionControl
							    shortcutKey: 'V' asShortcut) context: presenterInstance);
					  register: ((IceSBFileOutMethodCommand
							    forSpecWithIconNamed: #save
							    shortcutKey: 'O' asShortcut) context: presenterInstance);
					  register: ((IceSBCopySelectorCommand
							    forSpecWithIconNamed: #smallCopy
							    shortcutKey: 'C' asShortcut) context: presenterInstance);
					  beDisplayedAsGroup;
					  yourself)
]

{ #category : 'accessing' }
IceSnapshotBrowser class >> defaultPreferredExtent [

	^ 650 @ 400
]

{ #category : 'instance creation' }
IceSnapshotBrowser class >> forSnapshot: aMCSnapshot [

	^ self on: aMCSnapshot
]

{ #category : 'accessing' }
IceSnapshotBrowser >> allClassNames [
	^ (items 
		select: [:ea | (ea isOrganizationDefinition | ea isScriptDefinition) not]
		thenCollect: [:ea | ea className]) asSet.

]

{ #category : 'listing' }
IceSnapshotBrowser >> categorySelection [

	^ categoriesPresenter selectedItem
]

{ #category : 'text' }
IceSnapshotBrowser >> classCommentString [
	^ items
		detect: [ :ea | ea isClassDefinition and: [ ea className = self classSelection ] ]
		ifFound: [ :classDefinition | classDefinition comment ]
		ifNone: [ '' ]
]

{ #category : 'initialization' }
IceSnapshotBrowser >> classDefinitionString [

	| defs |
	defs := items select: [:ea | (ea isClassDefinition or: [ea isClassDefinitionExtension])
			and: [ea className = self classSelection]].

	defs isEmpty ifTrue: [^ 'This class is defined elsewhere.'].

	^ String streamContents: [:stream | 
		defs asArray sort 
			do: [:ea | ea printDefinitionOn: stream]
			separatedBy: [stream nextPut: $.; cr] ].
]

{ #category : 'initialization' }
IceSnapshotBrowser >> classSelection [

	^ classesPresenter selectedItem
]

{ #category : 'initialization' }
IceSnapshotBrowser >> classTarget: aClass [

	^ self isClassSide
		  ifTrue: [ aClass class ]
		  ifFalse: [ aClass ]
]

{ #category : 'initialization' }
IceSnapshotBrowser >> connectPresenters [

	categoriesPresenter 
		transmitTo: classesPresenter
		transform: [ : aCategory | 
			aCategory
				ifNotNil: [ self visibleClasses ]
				ifNil: [	Array empty ] ].

	classesPresenter
		transmitTo: protocolsPresenter
		transform: [ : aClass | aClass
		  ifNotNil: [ self visibleProtocols ]
		  ifNil: [ Array empty ] ].
		
	classesPresenter
		transmitTo: classDefinitionPresenter 
		transform: [ : aClass | self classDefinitionString ]
		postTransmission: [ : p | p unselectAll. ].
		
	protocolsPresenter
		transmitTo: methodsPresenter
		transform: [ : aProtocolName | 
			aProtocolName
				ifNotNil: [ self visibleMethods ]
				ifNil: [ Array empty ] ].
			
	methodsPresenter
		transmitTo: srcCodePresenter
		transform: [ :aMethod |
			aMethod
				ifNotNil: [ self updateSourceCode: aMethod ]
				ifNil: [ '' ] ]
		postTransmission: [ : p | p unselectAll. ]
]

{ #category : 'layout' }
IceSnapshotBrowser >> defaultLayout [

	^ SpPanedLayout newTopToBottom
		  add: (SpBoxLayout newLeftToRight
				   spacing: self spacingBetweenPanes;
				   add: categoriesPresenter;
				   add: classesPresenter;
				   add: (SpBoxLayout newTopToBottom
						    add: protocolsPresenter;
						    add: classOrInstanceSelectorPresenter expand: false;
						    yourself);
				   add: methodsPresenter;
				   yourself);
		  add: (SpBoxLayout newLeftToRight
				   spacing: self spacingBetweenPanes;
				   add: (SpBoxLayout newTopToBottom
						    spacing: self spacingBetweenPanes;
						    add: classDefinitionPresenter;
						    add: commentPresenter;
						    yourself);
				   add: srcCodePresenter;
				   yourself);
		  yourself
]

{ #category : 'accessing' }
IceSnapshotBrowser >> extensionClassNames [
	^ (self allClassNames difference: self packageClassNames) asSortedCollection
]

{ #category : 'accessing' }
IceSnapshotBrowser >> extensionsCategory [
	^ '*Extensions'
]

{ #category : 'file in/out' }
IceSnapshotBrowser >> fileOutMessage [
	"Put a description of the selected message on a file"

	| fileName |
	self selectedMessageName ifNotNil: [
		Cursor write showWhile: [
			self selectedClassOrMetaClass fileOutMethod: self selectedMessageName ].
			^ self ].
	items isEmpty ifTrue: [ ^ self ].
	fileName := MorphicUIManager new
		            request: 'File out on which file?'
		            initialAnswer: 'methods'.
	Cursor write showWhile: [
		| internalStream |
		internalStream := WriteStream on: (String new: 1000).
		internalStream
			header;
			timeStamp.
		items do: [ :patchOp |
			patchOp definition isMethodDefinition ifTrue: [
				(patchOp definition actualClass isNotNil and: [
					 patchOp definition actualClass includesSelector:
						 patchOp definition selector ])
					ifTrue: [
						patchOp definition actualClass
							printMethodChunk: patchOp definition selector
							on: internalStream ]
					ifFalse: [
						internalStream nextChunkPut:
							patchOp definition className , ' removeSelector: '
							, patchOp definition selector printString ] ].
			patchOp definition isClassDefinition ifTrue: [
				patchOp definition actualClass
					ifNotNil: [
						internalStream nextChunkPut:
							patchOp definition actualClass definition.
						patchOp definition comment ifNotNil: [
							patchOp definition actualClass putCommentOnFile: internalStream ] ]
					ifNil: [
						internalStream nextChunkPut:
							patchOp definition className , ' removeFromSystem' ] ] ].
		CodeExporter
			writeSourceCodeFrom: internalStream
			baseName: fileName
			isSt: true ]
]

{ #category : 'accessing' }
IceSnapshotBrowser >> hasExtensions [
	^ self extensionClassNames notEmpty
]

{ #category : 'initialization' }
IceSnapshotBrowser >> initializeCategoriesPresenter [

	categoriesPresenter := self newFilteringList.
	categoriesPresenter
		items: self visibleCategories;
		headerTitle: 'Categories';   
		displayIcon: [ : aPackage | self iconNamed: aPackage systemIconName ];
		sortingBlock: [ :a :b | a < b ] ;
		contextMenu: [ (self rootCommandsGroup / 'MCCategorySelContextualMenu') beRoot asMenuPresenter ].

]

{ #category : 'initialization' }
IceSnapshotBrowser >> initializeClassDefinitionPresenter [

	classDefinitionPresenter := self newCode
		beNotEditable;
		yourself.
]

{ #category : 'initialization' }
IceSnapshotBrowser >> initializeClassesPresenter [

	classesPresenter := self newFilteringList.
	classesPresenter
		items: self visibleClasses;
		headerTitle: 'Classes';
		displayIcon: [ :aClass | self iconNamed: aClass systemIconName ];
		sortingBlock: [ :a :b | a < b ];
		contextMenu: [ (self rootCommandsGroup / 'MCClassSelContextualMenu') beRoot asMenuPresenter ]
]

{ #category : 'initialization' }
IceSnapshotBrowser >> initializeCodePresenter [

	srcCodePresenter := self newCode
		beNotEditable;
		withoutSyntaxHighlight;
		withLineNumbers;
		yourself.
]

{ #category : 'initialization' }
IceSnapshotBrowser >> initializeCommentPresenter [

	commentPresenter := self newText
]

{ #category : 'initialization' }
IceSnapshotBrowser >> initializeMethodsPresenter [

	methodsPresenter := self newFilteringList.
	methodsPresenter
		items: OrderedCollection new;
		headerTitle: 'Methods';
		sortingBlock: [ :a :b | a < b ];
		contextMenu: [ (self rootCommandsGroup / 'MCMethodsSelContextualMenu') beRoot asMenuPresenter ]
]

{ #category : 'initialization' }
IceSnapshotBrowser >> initializePresenters [

	self initializeCategoriesPresenter.
	self initializeClassesPresenter.
	self initializeProtocolsPresenter.
	self initializeSideSelectorPresenter.
	self initializeClassDefinitionPresenter.
	self initializeMethodsPresenter.
	self initializeCodePresenter.
	self initializeCommentPresenter
]

{ #category : 'initialization' }
IceSnapshotBrowser >> initializeProtocolsPresenter [

	protocolsPresenter := self newFilteringList.
	protocolsPresenter
		headerTitle: 'Protocols';
		contextMenu: [ (self rootCommandsGroup / 'MCProtocolsSelContextualMenu') beRoot asMenuPresenter ]
]

{ #category : 'initialization' }
IceSnapshotBrowser >> initializeSideSelectorPresenter [

	classOrInstanceSelectorPresenter := self newCheckBox
		label: 'Class';
		whenActivatedDo: [ 
			protocolsPresenter 
				headerTitle: 'Class protocols';
				items: self visibleProtocols.
			classDefinitionPresenter 
				text: self metaclassDefinitionString;
				unselectAll ];

		whenDeactivatedDo: [ 
			protocolsPresenter 
				headerTitle: 'Instance protocols';
				items: self visibleProtocols.
			classDefinitionPresenter 
				text: self classDefinitionString;
				unselectAll  ];
		yourself.
]

{ #category : 'initialization' }
IceSnapshotBrowser >> isClassSide [
	"Answer <true> if the receiver's class side is selected"

	^ classOrInstanceSelectorPresenter isActive
]

{ #category : 'initialization' }
IceSnapshotBrowser >> metaclassDefinitionString [
	| defs |
	defs := items select: [:ea | (ea isClassDefinition or: [ea isClassDefinitionExtension])
			and: [ea className = self classSelection]].

	defs isEmpty ifTrue: [^ 'This class is defined elsewhere.'].

	^ String streamContents: [:stream | 
		defs asArray sort 
			do: [:ea | ea printClassDefinitionOn: stream]
			separatedBy: [stream nextPut: $.; cr] ].
]

{ #category : 'initialization' }
IceSnapshotBrowser >> methodsForSelectedClass [

	^ items select: [ :ea | ea className = self classSelection and: [ ea isMethodDefinition and: [ ea classIsMeta = self switchIsClass ] ] ]
]

{ #category : 'executing' }
IceSnapshotBrowser >> methodsForSelectedClassCategory [

	| visibleClasses |
	visibleClasses := self visibleClasses.
	^ items select: [ :ea |
		  (visibleClasses includes: ea className) and: [
			  ea isMethodDefinition and: [ ea classIsMeta = self switchIsClass ] ] ]
]

{ #category : 'accessing' }
IceSnapshotBrowser >> methodsForSelectedProtocol [

	| methods |
	
	self protocolSelection ifNil: [^ Array new].
	methods := self methodsForSelectedClass asOrderedCollection.
	(self protocolSelection = '-- all --') 
		ifFalse: [methods removeAllSuchThat: [:ea | ea protocol ~= self protocolSelection]].
	^ methods collect: #selector
	
								
]

{ #category : 'accessing' }
IceSnapshotBrowser >> packageClassNames [
	^ self packageClasses collect: [:ea | ea className]
]

{ #category : 'accessing' }
IceSnapshotBrowser >> packageClasses [
	^ items select: [:ea | ea isClassDefinition ]
]

{ #category : 'accessing' }
IceSnapshotBrowser >> packageOrganizations [

	^ items select: [:ea | ea isOrganizationDefinition]
]

{ #category : 'selecting' }
IceSnapshotBrowser >> protocolSelection [
	
	^ protocolsPresenter selectedItem
]

{ #category : 'file in/out' }
IceSnapshotBrowser >> selectedClassOrMetaClass [

	| class |

	self classSelection ifNil: [ ^ nil ].
	class := self class environment 
		at: self classSelection 
		ifAbsent: [ ^ nil ].
	^ self switchIsClass
		ifTrue: [ class class ]
		ifFalse: [ class ]
]

{ #category : 'file in/out' }
IceSnapshotBrowser >> selectedMessageName [
	"Answer a <Symbol> representing the currently selected method selector"

	^ self selectedMethod 
		ifNotNil: [ ^ self selectedMethod selector ].

]

{ #category : 'accessing' }
IceSnapshotBrowser >> selectedMethod [

	^ self methodsForSelectedClass anyOne
]

{ #category : 'accessing - model' }
IceSnapshotBrowser >> setModelBeforeInitialization: aMCSnapshot [

	items := aMCSnapshot definitions asSortedCollection.
	titleString := (aMCSnapshot definitions detect: #isOrganizationDefinition) packageName
]

{ #category : 'accessing' }
IceSnapshotBrowser >> spacingBetweenPanes [
	
	^ 5
]

{ #category : 'initialization' }
IceSnapshotBrowser >> switchIsClass [

	^ classOrInstanceSelectorPresenter state
]

{ #category : 'callbacks' }
IceSnapshotBrowser >> updateSourceCode: aMCMethodSelector [ 

	| mcDef |
	mcDef := items detect: [ : mcObject |
		(mcObject isMethodDefinition and: [ mcObject className = self classSelection ])
			and: [ mcObject selector = aMCMethodSelector ] ].
	^  mcDef source
]

{ #category : 'accessing' }
IceSnapshotBrowser >> visibleCategories [

	^ ((self packageOrganizations flatCollect: [ :ea | ea categories ]),
		(self packageClasses collect: [ :ea | ea category ]),
			(self hasExtensions ifTrue: [{ self extensionsCategory }] ifFalse: [#()]))
				asSet asSortedCollection
]

{ #category : 'listing' }
IceSnapshotBrowser >> visibleClasses [

	^ self categorySelection = self extensionsCategory
		ifTrue: [ self extensionClassNames ]
		ifFalse: [
			self packageClasses
				select: [:ea | ea category = self categorySelection]
				thenCollect: [:ea | ea className ] ].
]

{ #category : 'listing' }
IceSnapshotBrowser >> visibleMethods [

	^ self classSelection 
		ifNil: [#()]
		ifNotNil: [self methodsForSelectedProtocol]
]

{ #category : 'initialization' }
IceSnapshotBrowser >> visibleProtocols [

	| methods |

	methods := self methodsForSelectedClass.
	commentPresenter 
		text: self classCommentString;
		unselectAll.
	^ (methods collect: [ :ea | ea category ]) asSet asSortedCollection
]

{ #category : 'initialization' }
IceSnapshotBrowser >> windowTitle [
		
	^ 'Snapshot Browser for: ' , titleString
]
