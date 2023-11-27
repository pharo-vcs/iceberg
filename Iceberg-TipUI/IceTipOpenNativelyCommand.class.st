"
I am a command that, once executed, will open the native file browser on the directory containing the local repository of the git project.
"
Class {
	#name : 'IceTipOpenNativelyCommand',
	#superclass : 'IceTipCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipOpenNativelyCommand class >> defaultDescription [

	^ 'Open the native file browser on the local repository of this project.'
]

{ #category : 'accessing - defaults' }
IceTipOpenNativelyCommand class >> defaultName [

	^ 'Open in native file browser'
]

{ #category : 'testing' }
IceTipOpenNativelyCommand >> canBeExecuted [

	| location |
	self hasSelectedItem ifFalse: [ ^ false ].
	location := self item location.
	^ location isNotNil and: [ location exists ]
]

{ #category : 'executing' }
IceTipOpenNativelyCommand >> execute [

	self item location openInOSFileBrowser
]

{ #category : 'accessing' }
IceTipOpenNativelyCommand >> iconName [

	^ #smallWindow
]
