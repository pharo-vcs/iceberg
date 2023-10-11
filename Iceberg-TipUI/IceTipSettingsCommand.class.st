"
Command that opens the settings on a repository
"
Class {
	#name : 'IceTipSettingsCommand',
	#superclass : 'IceTipRepositoryCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipSettingsCommand class >> defaultDescription [

	^ 'Open settings browser to configure Iceberg'
]

{ #category : 'accessing - defaults' }
IceTipSettingsCommand class >> defaultName [

	^ 'Settings'
]

{ #category : 'testing' }
IceTipSettingsCommand >> canBeExecuted [ 
	
	"This command can be executed with our without selection"
	^ true
]

{ #category : 'executing' }
IceTipSettingsCommand >> execute [

	| browser window path |
	browser := SettingBrowser new 
		changePackageSet: { 
			#'Iceberg' asPackage.
			#'Iceberg-Libgit' asPackage };
		yourself.
	
	window := browser open.
	path := (window submorphs detect: [ :each | (each isKindOf: MorphTreeMorph) ]) nodeList.
	browser expandNodePath: path first contents first contents first path.
]

{ #category : 'accessing' }
IceTipSettingsCommand >> iconName [

	^ #configuration
]

{ #category : 'accessing' }
IceTipSettingsCommand >> shortcutKey [

	^ $n meta
]

{ #category : 'accessing' }
IceTipSettingsCommand >> shouldBeDisplayedOnRightSideInToolbar [

	^ true
]
