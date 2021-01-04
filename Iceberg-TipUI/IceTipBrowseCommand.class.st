"
I'm a command to ""browse"" a change definition (method, class or package).
"
Class {
	#name : #IceTipBrowseCommand,
	#superclass : #IceTipCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipBrowseCommand class >> defaultDescription [

	^ 'Browse the selected item'
]

{ #category : #accessing }
IceTipBrowseCommand class >> defaultName [

	^ 'Browse...'
]

{ #category : #execution }
IceTipBrowseCommand >> canBeExecuted [

	^ self hasSelectedItem

]

{ #category : #execution }
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
