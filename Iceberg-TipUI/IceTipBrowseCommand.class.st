"
I'm a command to ""browse"" a change definition (method, class or package).
"
Class {
	#name : #IceTipBrowseCommand,
	#superclass : #IceTipCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #'accessing - defaults' }
IceTipBrowseCommand class >> defaultDescription [

	^ 'Browse the selected item'
]

{ #category : #'accessing - defaults' }
IceTipBrowseCommand class >> defaultName [

	^ 'Browse...'
]

{ #category : #executing }
IceTipBrowseCommand >> canBeExecuted [

	^ self hasSelectedItem

]

{ #category : #executing }
IceTipBrowseCommand >> execute [

	self item value definition browse
]

{ #category : #accessing }
IceTipBrowseCommand >> iconName [

	^ #smallSystemBrowser
]

{ #category : #activation }
IceTipBrowseCommand >> shortcutKey [

	^ $b meta
]
