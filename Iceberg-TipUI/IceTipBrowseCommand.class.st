"
I'm a command to ""browse"" a change definition (method, class or package).
"
Class {
	#name : 'IceTipBrowseCommand',
	#superclass : 'IceTipCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipBrowseCommand class >> defaultDescription [

	^ 'Browse the selected item'
]

{ #category : 'accessing - defaults' }
IceTipBrowseCommand class >> defaultName [

	^ 'Browse...'
]

{ #category : 'testing' }
IceTipBrowseCommand >> canBeExecuted [
	"In the case of a method removal it is not possible to browse the selected element."

	^ self hasSelectedItem and: [ self item value definition canBeBrowsed ]
]

{ #category : 'executing' }
IceTipBrowseCommand >> execute [

	self item value definition browse
]

{ #category : 'accessing' }
IceTipBrowseCommand >> iconName [

	^ #smallSystemBrowser
]

{ #category : 'activation' }
IceTipBrowseCommand >> shortcutKey [

	^ $b meta
]
