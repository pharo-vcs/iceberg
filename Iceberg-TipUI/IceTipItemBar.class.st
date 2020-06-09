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
		'items'
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

{ #category : #'private dispatch' }
IceTipItemBar >> addItem: anItem [

	items add: anItem.
	self refresh
]

{ #category : #initialization }
IceTipItemBar >> initialize [
	super initialize.
	items := OrderedCollection new
]

{ #category : #'private accessing' }
IceTipItemBar >> leftPanel [
	^ leftPanel
]

{ #category : #'private accessing' }
IceTipItemBar >> leftPanel: anObject [
	leftPanel := anObject
]

{ #category : #'accessing ui' }
IceTipItemBar >> panel [
	^ panel
]

{ #category : #'accessing ui' }
IceTipItemBar >> panel: anObject [
	panel := anObject
]

{ #category : #items }
IceTipItemBar >> removeAll [
	
	items := OrderedCollection new.
	self refresh
]

{ #category : #'private accessing' }
IceTipItemBar >> rightPanel [
	^ rightPanel
]

{ #category : #'private accessing' }
IceTipItemBar >> rightPanel: anObject [
	rightPanel := anObject
]
