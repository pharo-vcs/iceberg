"
I'm a general bar to keep items inside. 
I can be extended to implement toolbars and statusbars.
"
Class {
	#name : #IceTipItemBar,
	#superclass : #SpPresenter,
	#instVars : [
		'panel',
		'leftPanel',
		'rightPanel',
		'items',
		'color'
	],
	#category : #'Iceberg-TipUI-Spec-ItemBar'
}

{ #category : #specs }
IceTipItemBar class >> defaultSpec [
	<spec: #default>
	^ SpBoxLayout newHorizontal
		add: #leftPanel;
		add: #rightPanel;
		yourself
]

{ #category : #accessing }
IceTipItemBar >> addItem: aToolbarItem [
	items add: aToolbarItem.
	self refresh
]

{ #category : #'private dispatch' }
IceTipItemBar >> addItemLeft: aButtonPresenter [
	self leftPanel add: aButtonPresenter 
]

{ #category : #'private dispatch' }
IceTipItemBar >> addItemRight: aButtonPresenter [
	self rightPanel add: aButtonPresenter.
]

{ #category : #accessing }
IceTipItemBar >> color [
	^ color ifNil: [ Color transparent ]
]

{ #category : #accessing }
IceTipItemBar >> color: aColor [
	color := aColor
]

{ #category : #initialization }
IceTipItemBar >> initialize [
	super initialize.
	items := OrderedCollection new
]

{ #category : #initialization }
IceTipItemBar >> initializeWidgets [

	leftPanel := self newButtonBar placeAtStart.
	rightPanel := self newButtonBar placeAtEnd


]

{ #category : #accessing }
IceTipItemBar >> items: aCollection [
	"We expect a collection to be made of specs"

	items := aCollection asOrderedCollection.
	self update.
]

{ #category : #'private accessing' }
IceTipItemBar >> leftPanel [
	^ leftPanel
]

{ #category : #'private accessing' }
IceTipItemBar >> leftPanel: anObject [
	leftPanel := anObject
]

{ #category : #'private factory' }
IceTipItemBar >> newPanelMorph [
	^ PanelMorph new 
		changeTableLayout;
		listDirection: #leftToRight;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		cellInset: self class defaultItemSeparation@0;
		color: self color;
		yourself
]

{ #category : #'accessing ui' }
IceTipItemBar >> panel [
	^ panel
]

{ #category : #'accessing ui' }
IceTipItemBar >> panel: anObject [
	panel := anObject
]

{ #category : #accessing }
IceTipItemBar >> refresh [

	self leftPanel items: #().
	self rightPanel items: #().
	items
		do:
			[ :each | each position addItem: (each newElementOn: self) into: self ]
]

{ #category : #'private accessing' }
IceTipItemBar >> rightPanel [
	^ rightPanel
]

{ #category : #'private accessing' }
IceTipItemBar >> rightPanel: anObject [
	rightPanel := anObject
]
