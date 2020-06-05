"
I'm a dialog that has different options. 
I'm a abstract class, I need to be used  through my children.

I'm kind of a ""tabbed"" dialog, but my options are ""mac style"": lateral and not top.

This is useful to keep a variable number of options.
"
Class {
	#name : #IceTipOptionDialog,
	#superclass : #SpPresenter,
	#instVars : [
		'typeList',
		'type',
		'contentPanel',
		'firstTimeBuild'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #specs }
IceTipOptionDialog class >> defaultSpec [
	<spec>
	^ SpBoxLayout newHorizontal
		add: #typeList withConstraints: [:constraints | constraints width: 180];
		add: #contentPanel;
		yourself
]

{ #category : #actions }
IceTipOptionDialog >> accept [
	^ [ self doAccept.
	true ]
		on: IceError , IceWarning
		do: [ :e | 
			e acceptError: IceTipInteractiveErrorVisitor new.
			false ]
]

{ #category : #accessing }
IceTipOptionDialog >> allTypes [
	^ self subclassResponsibility
]

{ #category : #private }
IceTipOptionDialog >> basicSelectionChanged: aType [
	type := aType.
	aType ifNotNil: [ 	
		self window title: type title.
		self replacePanelWith: type ]
]

{ #category : #'accessing ui' }
IceTipOptionDialog >> contentPanel [
	^ contentPanel
]

{ #category : #'accessing ui' }
IceTipOptionDialog >> contentPanel: anObject [
	contentPanel := anObject
]

{ #category : #accessing }
IceTipOptionDialog >> contextSelection [
	^ type
]

{ #category : #actions }
IceTipOptionDialog >> doAccept [
	self subclassResponsibility
]

{ #category : #private }
IceTipOptionDialog >> emptyPanel [
	^ PanelMorph new
		changeProportionalLayout;
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		yourself	
]

{ #category : #initialization }
IceTipOptionDialog >> giveFocusToNextFrom: aModel [

	super giveFocusToNextFrom: aModel
]

{ #category : #accessing }
IceTipOptionDialog >> initialExtent [
	^ (600@300) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipOptionDialog >> initializeDialogWindow: aPresenter [
	super initializeDialogWindow: aPresenter .
	aPresenter okAction: [ self doAccept ]
]

{ #category : #initialization }
IceTipOptionDialog >> initializeTypeList [
	typeList
		addColumn: ((SpImageTableColumn evaluated: #icon) width: 20);
		addColumn: (SpStringTableColumn evaluated: #title);
		whenSelectionChangedDo: [ :selection | self basicSelectionChanged: selection selectedItem ]; "replacePanelWith: selection selectedItem" 
		items: self allTypes
]

{ #category : #initialization }
IceTipOptionDialog >> initializeWidgets [
	firstTimeBuild := true.
	contentPanel := self newNullPresenter.
	typeList := self newTable.
	self initializeTypeList.
	self whenBuiltDo: [ :ann | firstTimeBuild ifTrue: [self selectFirst. firstTimeBuild :=false. ]]
]

{ #category : #focus }
IceTipOptionDialog >> refreshFocusOrder [
	self focusOrder
		removeAll;
		add: self typeList;
		add: self selectedType
]

{ #category : #private }
IceTipOptionDialog >> removeAllPanels [
	| panelMorph |
	
	panelMorph := self contentPanel morph.
	panelMorph removeAllMorphs
]

{ #category : #private }
IceTipOptionDialog >> replacePanelWith: aType [
	contentPanel = aType
		ifTrue: [ ^ self ].
	contentPanel := aType.
	contentPanel owner: self.
	self needRebuild: false.
	self buildWithSpec
]

{ #category : #private }
IceTipOptionDialog >> selectFirst [
	typeList adapter selectIndex: 1.
	self basicSelectionChanged: self allTypes first
]

{ #category : #accessing }
IceTipOptionDialog >> selectedType [
	^ type
]

{ #category : #private }
IceTipOptionDialog >> selectionChanged: ann [
	self
		basicSelectionChanged:
			(ann newSelectedIndexes
				ifNotEmpty:
					[ :indexes | self typeList widget dataSource realElementAt: indexes first ]
				ifEmpty: [ nil ])
]

{ #category : #'accessing ui' }
IceTipOptionDialog >> typeList [
	^ typeList
]

{ #category : #'accessing ui' }
IceTipOptionDialog >> typeList: anObject [
	typeList := anObject
]
