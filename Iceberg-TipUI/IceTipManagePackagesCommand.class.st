"
I'm a command to open the package manager browser for a project.
"
Class {
	#name : #IceTipManagePackagesCommand,
	#superclass : #IceTipRepositoryCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipManagePackagesCommand class >> defaultDescription [

	^ 'Open packages manager browser for this repository'
]

{ #category : #accessing }
IceTipManagePackagesCommand class >> defaultName [

	^ 'Packages'
]

{ #category : #execution }
IceTipManagePackagesCommand >> execute [
	(IceTipWorkingCopyBrowser on: self repositoryModel) openWithSpec
]

{ #category : #accessing }
IceTipManagePackagesCommand >> iconName [

	^ #package
]

{ #category : #accessing }
IceTipManagePackagesCommand >> shortcutKey [

	^ $p meta
]
