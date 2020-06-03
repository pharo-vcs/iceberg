"
I'm a simple action bar to be used as footer of certain panels (see IceTipCommentPanel as example)
"
Class {
	#name : #IceTipActionPanel,
	#superclass : #SpPresenter,
	#instVars : [
		'panel',
		'actions',
		'actionMorphPanel',
		'actionWidth',
		'actionsButtonBar'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #accessing }
IceTipActionPanel class >> defaultActionWidth [
	^ 100 * self currentWorld displayScaleFactor
]

{ #category : #accessing }
IceTipActionPanel class >> defaultHeight [
	^ 25 * self currentWorld displayScaleFactor
]

{ #category : #specs }
IceTipActionPanel class >> defaultSpec [
	<spec: #default>
	^ SpBoxLayout newVertical
		add: #actionsButtonBar height: self  buttonHeight ;
		yourself
]

{ #category : #accessing }
IceTipActionPanel >> actionWidth [
	^ actionWidth ifNil: [ self class defaultActionWidth ]
]

{ #category : #initialization }
IceTipActionPanel >> actionWidth: aNumber [
	actionWidth := aNumber
]

{ #category : #accessing }
IceTipActionPanel >> addAction: aPresenter [
	actions add: aPresenter.
	self refresh
]

{ #category : #initialization }
IceTipActionPanel >> initialize [
	actions := OrderedCollection new.
	super initialize
]

{ #category : #initialization }
IceTipActionPanel >> initializeWidgets [
	actionsButtonBar := self newButtonBar 
	"
		addMorphBack:
			(actionMorphPanel := PanelMorph new
				changeTableLayout;
				listDirection: #rightToLeft;
				hResizing: #shrinkWrap;
				vResizing: #spaceFill;
				yourself)"
]

{ #category : #initialization }
IceTipActionPanel >> newIcePanel [
	^ super newIcePanel
		in: [ :this | this widget listDirection: #rightToLeft];
		yourself
]

{ #category : #'accessing ui' }
IceTipActionPanel >> panel [
	^ panel
]

{ #category : #'accessing ui' }
IceTipActionPanel >> panel: anObject [
	panel := anObject
]

{ #category : #initialization }
IceTipActionPanel >> refresh [
	actionsButtonBar items: OrderedCollection new .
	actions do: [ :each | actionsButtonBar add: each ]
]
