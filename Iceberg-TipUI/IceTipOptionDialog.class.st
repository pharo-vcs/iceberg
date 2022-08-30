"
I'm a dialog that has different options. 
I'm a abstract class, I need to be used  through my children.

I'm kind of a ""tabbed"" dialog, but my options are ""mac style"": lateral and not top.

This is useful to keep a variable number of options.
"
Class {
	#name : #IceTipOptionDialog,
	#superclass : #IceTipPresenter,
	#instVars : [
		'typeList',
		'type',
		'contentLayout'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #actions }
IceTipOptionDialog >> accept [

	^ [ 
	  self doAccept.
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

{ #category : #accessing }
IceTipOptionDialog >> contextSelection [

	^ type
]

{ #category : #layout }
IceTipOptionDialog >> defaultLayout [

	^ SpPanedLayout newLeftToRight
		  positionOfSlider: 30 percent;
		  add: typeList;
		  add: contentLayout;
		  yourself
]

{ #category : #actions }
IceTipOptionDialog >> doAccept [

	self subclassResponsibility
]

{ #category : #initialization }
IceTipOptionDialog >> initialExtentForWindow [

	^ (700 @ 300) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipOptionDialog >> initializeDialogWindow: aWindowPresenter [

	super initializeDialogWindow: aWindowPresenter.
	aWindowPresenter okAction: [ self doAccept ].
	aWindowPresenter whenOpenedDo: [ self typeList selectIndex: 1 ]
]

{ #category : #initialization }
IceTipOptionDialog >> initializePresenters [

	contentLayout := SpBoxLayout newVertical.
	typeList := self newTable.
	self initializeTypeList
]

{ #category : #initialization }
IceTipOptionDialog >> initializeTypeList [

	typeList
		hideColumnHeaders;
		addColumn: ((SpImageTableColumn evaluated: #iconForWindow) width: 20);
		addColumn: (SpStringTableColumn evaluated: #titleForWindow);
		whenSelectionChangedDo: [ :selection | 
			self selectionChanged: selection selectedItem ];
		items: self allTypes
]

{ #category : #private }
IceTipOptionDialog >> replacePanelWith: aType [

	contentLayout 
		removeAll;
		add: aType
]

{ #category : #accessing }
IceTipOptionDialog >> selectedType [

	^ type
]

{ #category : #private }
IceTipOptionDialog >> selectionChanged: aType [

	type := aType.
	aType ifNotNil: [ 
		self window title: type titleForWindow.
		self replacePanelWith: type ]
]

{ #category : #'accessing - ui' }
IceTipOptionDialog >> typeList [

	^ typeList
]
