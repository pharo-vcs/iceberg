"
I'm a command to show the repository manager for a repository model. 

"
Class {
	#name : #IceTipManageRepositoryCommand,
	#superclass : #IceTipRepositoryCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipManageRepositoryCommand class >> defaultDescription [

	^ 'Open repository manager browser for this repository.'
]

{ #category : #accessing }
IceTipManageRepositoryCommand class >> defaultName [

	^ 'Open Repository'
]

{ #category : #accessing }
IceTipManageRepositoryCommand class >> defaultToolbarItemName [

	^ 'Repository'
]

{ #category : #testing }
IceTipManageRepositoryCommand >> canBeExecuted [

	^ self isRepositoryMissing not
]

{ #category : #execution }
IceTipManageRepositoryCommand >> execute [

	(IceTipRepositoryBrowser on: self repositoryModel) openWithSpec
]

{ #category : #accessing }
IceTipManageRepositoryCommand >> iconName [

	^ #komitterSmalltalkhubRemote
]

{ #category : #accessing }
IceTipManageRepositoryCommand >> shortcutKey [

	^ $r meta
]

{ #category : #testing }
IceTipManageRepositoryCommand >> shouldBeDisplayedOnRightSideInToolbar [

	^ true
]
