"
Command that opens a dialog to add a/many package/s into the selected repository.
"
Class {
	#name : #IceTipAddPackageCommand,
	#superclass : #IceTipRepositoryCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipAddPackageCommand class >> defaultDescription [

	^ 'Adds an existing package to this repository'
]

{ #category : #accessing }
IceTipAddPackageCommand class >> defaultName [

	^ 'Add package'
]

{ #category : #execution }
IceTipAddPackageCommand >> execute [

	(IceTipAddPackagesDialog on: self repositoryModel) openDialogWithSpec
]

{ #category : #accessing }
IceTipAddPackageCommand >> iconName [

	^ #add
]

{ #category : #accessing }
IceTipAddPackageCommand >> shortcutKey [

	^ $n meta
]

{ #category : #testing }
IceTipAddPackageCommand >> shouldBeDisplayedOnRightSideInToolbar [

	^ true
]
