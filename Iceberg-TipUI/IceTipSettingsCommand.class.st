"
Command that opens the settings on a repository
"
Class {
	#name : #IceTipSettingsCommand,
	#superclass : #IceTipRepositoryCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipSettingsCommand class >> defaultDescription [

	^ 'Open settings browser to configure Iceberg'
]

{ #category : #accessing }
IceTipSettingsCommand class >> defaultName [

	^ 'Settings'
]

{ #category : #execution }
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

{ #category : #accessing }
IceTipSettingsCommand >> iconName [

	^ #configuration
]

{ #category : #accessing }
IceTipSettingsCommand >> shouldBeDisplayedOnRightSideInToolbar [

	^ true
]
