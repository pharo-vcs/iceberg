"
I am a toolbar. 
I can create toolbars to be added to spec windows (usually on top).

You can instantiate it in a Spec component as is:

toolbar := self instantiate: IceTipToolbar.
toolbar displayModel: IceTipToolbarDisplayMode modeIconAndLabel.
toolbar addItem: (IceTipToolbarItem new
	label: 'Test';
	icon: #add asIcon;
	position: IceTipToolbarItemPosition left;
	yourself)
"
Class {
	#name : #IceTipToolbar,
	#superclass : #IceTipItemBar,
	#instVars : [
		'toolbarItemFont',
		'displayMode'
	],
	#category : #'Iceberg-TipUI-Spec-ItemBar'
}

{ #category : #accessing }
IceTipToolbar class >> defaultHeight [
	^ self defaultMode height * World displayScaleFactor
]

{ #category : #accessing }
IceTipToolbar class >> defaultItemSize [
	^ 50 * World displayScaleFactor
]

{ #category : #accessing }
IceTipToolbar class >> defaultMode [
	^ IceTipToolbarDisplayMode default
]

{ #category : #'private dispatch' }
IceTipToolbar >> addItemLeft: aButtonPresenter [
	self leftPanel add: aButtonPresenter 
]

{ #category : #'private dispatch' }
IceTipToolbar >> addItemRight: aButtonPresenter [
	self rightPanel add: aButtonPresenter.
]

{ #category : #accessing }
IceTipToolbar >> addItemsFromContext: aContext [
	| menu |
	
	menu := CmdMenu activatedBy: IceTipToolbarActivation.
	menu buildInContext: aContext.
	menu buildIceToolbarOn: self

]

{ #category : #accessing }
IceTipToolbar >> displayMode [
	^ displayMode ifNil: [ displayMode := IceTipToolbarDisplayMode default ]
]

{ #category : #accessing }
IceTipToolbar >> displayMode: anObject [
	displayMode := anObject
]

{ #category : #initialization }
IceTipToolbar >> initializeWidgets [

	leftPanel := self newButtonBar placeAtStart.
	rightPanel := self newButtonBar placeAtEnd


]

{ #category : #'private factory' }
IceTipToolbar >> newToolbarItemFont [
	| buttonFont |
	buttonFont := Smalltalk ui theme buttonFont.
	^ LogicalFont 
		familyName: buttonFont familyName 
		pointSize: buttonFont pointSize - 3
]

{ #category : #accessing }
IceTipToolbar >> refresh [

	self leftPanel items: #().
	self rightPanel items: #().
	items
		do:
			[ :each | each position addItem: (each newElementOn: self) into: self ]
]

{ #category : #accessing }
IceTipToolbar >> toolbarItemFont [
	^ toolbarItemFont ifNil: [ toolbarItemFont := self newToolbarItemFont ]
]

{ #category : #accessing }
IceTipToolbar >> toolbarItemFont: anObject [
	toolbarItemFont := anObject
]

{ #category : #accessing }
IceTipToolbar >> toolbarItemSize [
	^ self class defaultItemSize
]
