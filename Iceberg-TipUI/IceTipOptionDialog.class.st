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

	[ 
	  self doAccept.
	  self closeWindow ]
		  on: IceError , IceWarning
		  do: [ :e | 
			  e acceptError: (IceTipInteractiveErrorVisitor newContext: self) ]
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

	aWindowPresenter
		addButton: 'Ok' do: [ :presenter | self accept ];
		addButton: 'Cancel' do: [ :presenter | presenter close ].	
			
	aWindowPresenter whenOpenedDo: [ self typeList selectIndex: 1 ]
]

{ #category : #initialization }
IceTipOptionDialog >> initializePresenters [

	contentLayout := SpBoxLayout newTopToBottom.
	self initializeTypeList
]

{ #category : #initialization }
IceTipOptionDialog >> initializeTypeList [

	(typeList := self newList)
		items: self allTypes;
		display: [ :aType | aType titleForWindow ];
		displayIcon: [ :aType | aType iconForWindow ];
		whenSelectionChangedDo: [ :selection | 
			self selectionChanged: selection selectedItem ]		
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
