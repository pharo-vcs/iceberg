"
I'm a command to open the package manager browser for a project.

I have an option to group the windows I'm opening into one group windows.
"
Class {
	#name : 'IceTipManagePackagesCommand',
	#superclass : 'IceTipRepositoryCommand',
	#classVars : [
		'ShouldGroupRepositories'
	],
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipManagePackagesCommand class >> defaultDescription [

	^ 'Open packages manager browser for this repository'
]

{ #category : 'accessing - defaults' }
IceTipManagePackagesCommand class >> defaultName [

	^ 'Packages'
]

{ #category : 'settings' }
IceTipManagePackagesCommand class >> settingsOn: aBuilder [

	<systemsettings>
	(aBuilder setting: #shouldGroupRepositories)
		parent: #Iceberg;
		target: self;
		label: 'Group repositories in a group window';
		description: 'If this settings get enabled, the repositories you will open will be grouped in the same window.'
]

{ #category : 'asserting' }
IceTipManagePackagesCommand class >> shouldGroupRepositories [

	^ ShouldGroupRepositories ifNil: [ ShouldGroupRepositories := true ]
]

{ #category : 'asserting' }
IceTipManagePackagesCommand class >> shouldGroupRepositories: aBoolean [

	ShouldGroupRepositories := aBoolean
]

{ #category : 'executing' }
IceTipManagePackagesCommand >> execute [

	| browser group |
	browser := (IceTipWorkingCopyBrowser newApplication: context application model: self repositoryModel workingCopyModel) open.

	self class shouldGroupRepositories ifFalse: [ ^ self ].

	group := (self currentWorld windowsSatisfying: [ :window | window label = 'Iceberg Repositories' ])
		         ifEmpty: [
				         | window |
				         window := GroupWindowMorph new.
				         (window openInWindowLabeled: 'Iceberg Repositories') extent: 1200 @ 800.
				         window ]
		         ifNotEmpty: [ :ws |
				         | window |
				         window := ws first.
				         window isMinimized
					         ifTrue: [ window restore ]
					         ifFalse: [ window activate ].
				         window paneMorphs first ].
	group addWindow: browser window
]

{ #category : 'accessing' }
IceTipManagePackagesCommand >> iconName [

	^ #package
]

{ #category : 'accessing' }
IceTipManagePackagesCommand >> shortcutKey [

	^ $p meta
]
