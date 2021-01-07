Class {
	#name : #IceTipSpPresenter,
	#superclass : #SpPresenter,
	#category : #'Iceberg-TipUI-View'
}

{ #category : #specs }
IceTipSpPresenter class >> title [
	^ self subclassResponsibility
]

{ #category : #private }
IceTipSpPresenter >> closeWindow [
	"Close the window of this presenter"

	self window close
]
