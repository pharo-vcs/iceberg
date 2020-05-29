"
I am a command that, once executed, will open the native file browser on the directory containing the local repository of the git project.
"
Class {
	#name : #IceTipOpenNativelyCommand,
	#superclass : #IceTipCommand,
	#instVars : [
		'location'
	],
	#category : #'Iceberg-TipUI'
}

{ #category : #activation }
IceTipOpenNativelyCommand class >> browserRepositoryListActivation [
	<classAnnotation>
	
	^ CmdContextMenuActivation
		byItemOf: CmdExtraMenuGroup
		order: 10000
		for: IceTipRepositoryListContext
]

{ #category : #testing }
IceTipOpenNativelyCommand class >> canBeExecutedInContext: aToolContext [
	| location | 
	location := aToolContext item location.
	^ location isNotNil and: [ location exists ]
]

{ #category : #accessing }
IceTipOpenNativelyCommand class >> defaultHelp [
	^ 'Open the native file browser on the local repository of this project.'
]

{ #category : #accessing }
IceTipOpenNativelyCommand class >> defaultMenuIconName [
	^ #smallWindow
]

{ #category : #accessing }
IceTipOpenNativelyCommand class >> defaultMenuItemName [
	^ 'Open in native file browser'
]

{ #category : #execution }
IceTipOpenNativelyCommand >> execute [
	self flag: #pharo8. "This condition can be removed once Iceberg will require Pharo 8+"
	self class environment
		at: #ManifestNativeBrowser
		ifPresent: [ :class | location openInOSFileBrowser ]
		ifAbsent: [ self inform: 'This action needs the Native-Browser project loaded in the image to work.' ]
]

{ #category : #execution }
IceTipOpenNativelyCommand >> readParametersFromContext: aToolContext [
	super readParametersFromContext: aToolContext.
	location := aToolContext item location
]
