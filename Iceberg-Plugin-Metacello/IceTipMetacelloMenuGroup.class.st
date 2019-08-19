"
I'm the common group for metacello extensions.
"
Class {
	#name : #IceTipMetacelloMenuGroup,
	#superclass : #CmdMenuGroup,
	#category : #'Iceberg-Plugin-Metacello'
}

{ #category : #accessing }
IceTipMetacelloMenuGroup >> addItem: aMenuItem [

	(aMenuItem name = 'IceTipMetacelloRepositoryInstallBaselineCommand') 
		ifTrue: [ aMenuItem command fillContextMenu: self using: aMenuItem activator ]
		ifFalse: [ super addItem: aMenuItem  ]
]

{ #category : #accessing }
IceTipMetacelloMenuGroup >> description [

	^ 'Metacello install operations'
]

{ #category : #accessing }
IceTipMetacelloMenuGroup >> name [

	^ 'Metacello'
]

{ #category : #accessing }
IceTipMetacelloMenuGroup >> order [
	"Plugins are SmallInteger maxVal - 2000 .. SmallInteger maxVal"
	^ SmallInteger maxVal - 1000
]
