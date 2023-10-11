"
I'm a command to show the repository manager for a repository model. 

"
Class {
	#name : 'IceTipManageRepositoryCommand',
	#superclass : 'IceTipRepositoryCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipManageRepositoryCommand class >> defaultDescription [

	^ 'Open repository manager browser for this repository.'
]

{ #category : 'accessing - defaults' }
IceTipManageRepositoryCommand class >> defaultName [

	^ 'Open Repository'
]

{ #category : 'accessing - defaults' }
IceTipManageRepositoryCommand class >> defaultToolbarItemName [

	^ 'Repository'
]

{ #category : 'testing' }
IceTipManageRepositoryCommand >> canBeExecuted [

	^ super canBeExecuted and: [ self isRepositoryMissing not ]
]

{ #category : 'executing' }
IceTipManageRepositoryCommand >> execute [

	(IceTipRepositoryBrowser 
		newApplication: context application 
		model: self repositoryModel) 
		open
]

{ #category : 'accessing' }
IceTipManageRepositoryCommand >> iconName [

	^ #komitterSmalltalkhubRemote
]

{ #category : 'accessing' }
IceTipManageRepositoryCommand >> shortcutKey [

	^ $r meta
]

{ #category : 'testing' }
IceTipManageRepositoryCommand >> shouldBeDisplayedOnRightSideInToolbar [

	^ true
]
