"
I'm a base tool for iceberg Tip-UI. 
My children will implement real tools, but I provide certain common elements. 

Some remarks about design: 

1. Each tool has to have ONE model as entry point for data, and JUST ONE. It will be contained 
   in #model accessor.
"
Class {
	#name : #IceTipBrowser,
	#superclass : #SpPresenter,
	#instVars : [
		'model',
		'toolbar'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #initialization }
IceTipBrowser >> addShortcutsTo: aWidget [
	| shortcuts |
	shortcuts := CmdShortcutActivation registeredInstances
		select: [ :each | each activeContext describes: self newContext ].
	shortcuts do: [ :shortcut | self bindKeyCombination: shortcut keyCombination toAction: [ self executeShortcut: shortcut ] ]
]

{ #category : #accessing }
IceTipBrowser >> buildMenu [ 
	
	^ (CmdContextMenuActivation buildMenuInContext: self createCommandContext) asSpMenuPresenter
]

{ #category : #accessing }
IceTipBrowser >> contextClass [
	^ self subclassResponsibility
]

{ #category : #'private factory' }
IceTipBrowser >> createCommandContext [
	^ self newContext
]

{ #category : #'as yet unclassified' }
IceTipBrowser >> executeShortcut: aCmdShortcutActivation [ 
	| context |
	context := self createCommandContext .
	(	aCmdShortcutActivation commandClass canBeExecutedInContext: context) 
			ifTrue: [ aCmdShortcutActivation commandClass new readParametersFromContext: context ; execute  ]
]

{ #category : #accessing }
IceTipBrowser >> iconNamed: aSymbol [
	^ Smalltalk ui icons iconNamed: aSymbol
]

{ #category : #accessing }
IceTipBrowser >> initialExtent [
	^ (600@400) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipBrowser >> initialize [
	super initialize.
	self subscribeToAnnouncements
]

{ #category : #initialization }
IceTipBrowser >> initializeToolbar [
	toolbar := self instantiate: IceTipToolbar.
	self rebuildToolbar
]

{ #category : #initialization }
IceTipBrowser >> initializeWidgets [
	self initializeToolbar.
	self whenBuiltDo: [ :ann | self addShortcutsTo: ann widget ]
]

{ #category : #accessing }
IceTipBrowser >> model [
	^ model
]

{ #category : #accessing }
IceTipBrowser >> model: anObject [
	model := anObject
]

{ #category : #'private factory' }
IceTipBrowser >> newContext [
	^ (self contextClass for: self)
		readContextParametersFromModel: self model;
		yourself
]

{ #category : #'private factory' }
IceTipBrowser >> newContextWithSelection: anObject [
	^ self newContext
]

{ #category : #accessing }
IceTipBrowser >> rebuildToolbar [
	toolbar items: #().
	toolbar addItemsFromContext: self newContext
]

{ #category : #accessing }
IceTipBrowser >> refresh [
	
]

{ #category : #accessing }
IceTipBrowser >> refreshToolbar [
	toolbar refresh
]

{ #category : #initialization }
IceTipBrowser >> setModelBeforeInitialization: anObject [
	model := anObject
]

{ #category : #initialization }
IceTipBrowser >> subscribeToAnnouncements [
]

{ #category : #'accessing ui' }
IceTipBrowser >> toolbar [
	^ toolbar
]

{ #category : #'accessing ui' }
IceTipBrowser >> toolbar: anObject [
	toolbar := anObject
]

{ #category : #accessing }
IceTipBrowser >> windowIcon [
	^ self iconNamed: #komitterSmalltalkhubRemote
]
