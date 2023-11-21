"
Command that opens a dialog to add a/many package/s into the selected repository.
"
Class {
	#name : 'IceTipAddPackageCommand',
	#superclass : 'IceTipRepositoryCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipAddPackageCommand class >> defaultDescription [

	^ 'Adds an existing package to this repository'
]

{ #category : 'accessing - defaults' }
IceTipAddPackageCommand class >> defaultName [

	^ 'Add package'
]

{ #category : 'executing' }
IceTipAddPackageCommand >> execute [

	(IceTipAddPackagesDialogPresenter 
		newApplication: context application 
		model: self repositoryModel) 
		asDialogWindow 
			centeredRelativeTo: context window;
			open
]

{ #category : 'accessing' }
IceTipAddPackageCommand >> iconName [

	^ #add
]

{ #category : 'accessing' }
IceTipAddPackageCommand >> shortcutKey [

	^ $n meta
]

{ #category : 'testing' }
IceTipAddPackageCommand >> shouldBeDisplayedOnRightSideInToolbar [

	^ true
]
