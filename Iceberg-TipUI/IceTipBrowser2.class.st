Class {
	#name : #IceTipBrowser2,
	#superclass : #SpPresenter,
	#instVars : [
		'model',
		'toolbar'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #initialization }
IceTipBrowser2 >> addShortcutsTo: aPresenter [
	| shortcuts |
	self flag: #todo. "Migrate to Commander2"
	shortcuts := CmdShortcutActivation registeredInstances
		select: [ :each | each activeContext describes: self newContext ].
	shortcuts do: [ :shortcut | 
		aPresenter
			bindKeyCombination: shortcut keyCombination
			toAction: [ self executeShortcut: shortcut ] ]
]

{ #category : #accessing }
IceTipBrowser2 >> buildMenu [ 
	
	self flag: #todo. "Migrate to Commander2"
	^ (CmdContextMenuActivation buildMenuInContext: self createCommandContext) asSpMenuPresenter
]

{ #category : #accessing }
IceTipBrowser2 >> contextClass [
	^ self subclassResponsibility
]

{ #category : #'private factory' }
IceTipBrowser2 >> createCommandContext [
	^ self newContext
]

{ #category : #initialization }
IceTipBrowser2 >> executeShortcut: aCmdShortcutActivation [ 
	| context |
	context := self createCommandContext .
	(	aCmdShortcutActivation commandClass canBeExecutedInContext: context) 
			ifTrue: [ aCmdShortcutActivation commandClass new readParametersFromContext: context ; execute  ]
]

{ #category : #accessing }
IceTipBrowser2 >> initialExtentForWindow [

	^ (600 @ 400) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipBrowser2 >> initialize [
	super initialize.
	self subscribeToAnnouncements
]

{ #category : #initialization }
IceTipBrowser2 >> initializePresenters [

	toolbar := self newToolbar.
	self rebuildToolbar.
	self addShortcutsTo: self
]

{ #category : #initialization }
IceTipBrowser2 >> initializeWindow: aSpWindowPresenter [

	aSpWindowPresenter
		toolbar: toolbar;
		initialExtent: self initialExtentForWindow
]

{ #category : #accessing }
IceTipBrowser2 >> model [
	^ model
]

{ #category : #accessing }
IceTipBrowser2 >> model: anObject [
	model := anObject
]

{ #category : #'private factory' }
IceTipBrowser2 >> newContext [
	^ (self contextClass for: self)
		readContextParametersFromModel: self model;
		yourself
]

{ #category : #'private factory' }
IceTipBrowser2 >> newContextWithSelection: anObject [
	^ self newContext
]

{ #category : #accessing }
IceTipBrowser2 >> rebuildToolbar [

	|menu|
	self flag: #todo. "Migrate to Commander2"
	toolbar removeAllItems.
	menu := CmdMenu activatedBy: IceTipToolbarActivation.
	menu buildInContext: self newContext.
	menu buildIceToolbarOn: toolbar .
]

{ #category : #accessing }
IceTipBrowser2 >> refresh [
	
]

{ #category : #initialization }
IceTipBrowser2 >> setModelBeforeInitialization: anObject [

	model := anObject
]

{ #category : #initialization }
IceTipBrowser2 >> subscribeToAnnouncements [
]

{ #category : #'accessing ui' }
IceTipBrowser2 >> toolbar [
	^ toolbar
]

{ #category : #accessing }
IceTipBrowser2 >> windowIcon [
	^ self iconNamed: #komitterSmalltalkhubRemote
]
