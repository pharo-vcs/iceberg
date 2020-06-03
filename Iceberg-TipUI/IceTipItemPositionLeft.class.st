"
I place item buttons at left. 
I am the default behaviour.
"
Class {
	#name : #IceTipItemPositionLeft,
	#superclass : #IceTipItemPosition,
	#category : #'Iceberg-TipUI-Spec-ItemBar'
}

{ #category : #'adding item' }
IceTipItemPositionLeft >> add: aSpToolBarButton to: aSpToolBarPresenter [ 
	aSpToolBarPresenter addItemLeft: aSpToolBarButton 
]

{ #category : #accessing }
IceTipItemPositionLeft >> addItem: anObject into: aToolbar [
	aToolbar addItemLeft: anObject
]
