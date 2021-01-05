"
I'm a simple action bar to be used as footer of certain panels (see IceTipCommentPanel as example)
"
Class {
	#name : #IceTipActionPanel,
	#superclass : #SpPresenter,
	#instVars : [
		'actionWidth',
		'actions',
		'actionsButtonBar',
		'panel'
	],
	#category : #'Iceberg-TipUI-Spec2'
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

{ #category : #accessing }
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
IceTipActionPanel >> initializePresenters [

	actionsButtonBar := self newButtonBar 

]

{ #category : #'accessing ui' }
IceTipActionPanel >> panel [

	^ panel
]

{ #category : #initialization }
IceTipActionPanel >> refresh [

	actionsButtonBar items: OrderedCollection new.
	actions do: [ :each | actionsButtonBar add: each ]
]
