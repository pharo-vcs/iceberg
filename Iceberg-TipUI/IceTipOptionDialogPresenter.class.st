"
I'm a dialog that has different options. 
I'm a abstract class, I need to be used  through my children.

I'm kind of a ""tabbed"" dialog, but my options are ""mac style"": lateral and not top.

This is useful to keep a variable number of options.
"
Class {
	#name : 'IceTipOptionDialogPresenter',
	#superclass : 'IceTipPresenter',
	#instVars : [
		'typeList',
		'type',
		'contentLayout'
	],
	#category : 'Iceberg-TipUI-View',
	#package : 'Iceberg-TipUI',
	#tag : 'View'
}

{ #category : 'actions' }
IceTipOptionDialogPresenter >> accept [

	[ 
	  self doAccept.
	  self closeWindow ]
		  on: IceError , IceWarning
		  do: [ :e | 
			  e acceptError: (IceTipInteractiveErrorVisitor newContext: self) ]
]

{ #category : 'accessing' }
IceTipOptionDialogPresenter >> allTypes [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
IceTipOptionDialogPresenter >> contextSelection [

	^ type
]

{ #category : 'layout' }
IceTipOptionDialogPresenter >> defaultLayout [

	^ SpPanedLayout newLeftToRight
		  positionOfSlider: 30 percent;
		  add: typeList;
		  add: contentLayout;
		  yourself
]

{ #category : 'actions' }
IceTipOptionDialogPresenter >> doAccept [

	self subclassResponsibility
]

{ #category : 'initialization' }
IceTipOptionDialogPresenter >> initialExtentForWindow [

	^ (700 @ 300) scaledByDisplayScaleFactor
]

{ #category : 'initialization' }
IceTipOptionDialogPresenter >> initializeDialogWindow: aWindowPresenter [

	aWindowPresenter
		addButton: 'Cancel' do: [ :presenter | presenter close ];
		addDefaultButton: 'Ok' do: [ :presenter | self accept ].	
			
	aWindowPresenter whenOpenedDo: [ self typeList selectIndex: 1 ]
]

{ #category : 'initialization' }
IceTipOptionDialogPresenter >> initializePresenters [

	contentLayout := SpBoxLayout newTopToBottom.
	self initializeTypeList
]

{ #category : 'initialization' }
IceTipOptionDialogPresenter >> initializeTypeList [

	(typeList := self newList)
		items: self allTypes;
		display: [ :aType | aType titleForWindow ];
		displayIcon: [ :aType | aType iconForWindow ];
		whenSelectionChangedDo: [ :selection | 
			self selectionChanged: selection selectedItem ]		
]

{ #category : 'private' }
IceTipOptionDialogPresenter >> replacePanelWith: aType [

	contentLayout 
		removeAll;
		add: aType
]

{ #category : 'accessing' }
IceTipOptionDialogPresenter >> selectedType [

	^ type
]

{ #category : 'private' }
IceTipOptionDialogPresenter >> selectionChanged: aType [

	type := aType.
	aType ifNotNil: [
		self updateWindowTitle.
		self replacePanelWith: type ]
]

{ #category : 'accessing - ui' }
IceTipOptionDialogPresenter >> typeList [

	^ typeList
]

{ #category : 'private' }
IceTipOptionDialogPresenter >> updateWindowTitle [
	
	self window title: type titleForWindow
]
