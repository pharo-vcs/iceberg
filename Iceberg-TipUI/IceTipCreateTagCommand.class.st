"
I an a commander command that will be activated on any commitish or repository and ask the selected item to create a tag on itself.
"
Class {
	#name : #IceTipCreateTagCommand,
	#superclass : #IceTipCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #'accessing - defaults' }
IceTipCreateTagCommand class >> defaultDescription [

	^ 'Creates a tag for the selected commit'
]

{ #category : #'accessing - defaults' }
IceTipCreateTagCommand class >> defaultName [

	^ 'Create tag'
]

{ #category : #executing }
IceTipCreateTagCommand >> execute [
	
	(IceTipCreateTagPanel on: self item) openDialogWithSpec
]

{ #category : #activation }
IceTipCreateTagCommand >> iconName [

	^ #glamorousBookmark
]
