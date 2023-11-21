"
Command that opens a dialog to remove a package.
It gives the user with two checkboxes to choose:
 - remove from repository
 - unload

Right now this is only shown for loaded packages.
"
Class {
	#name : 'IceTipUnloadAndRemovePackageCommand',
	#superclass : 'IceTipPackageCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipUnloadAndRemovePackageCommand class >> defaultDescription [

	^ 'Opens a dialog to choose between unloading from system and/or removing a package from the repository'
]

{ #category : 'accessing - defaults' }
IceTipUnloadAndRemovePackageCommand class >> defaultName [

	^ 'Unload and/or remove from repository'
]

{ #category : 'testing' }
IceTipUnloadAndRemovePackageCommand >> canBeExecuted [

	^ self isPackageLoaded
]

{ #category : 'executing' }
IceTipUnloadAndRemovePackageCommand >> execute [

	(IceTipRemovePackageDialogPresenter 
		newApplication: context application 
		model: self packageModel) 
		asModalWindow 
			centeredRelativeTo: context window;
			open
]

{ #category : 'accessing' }
IceTipUnloadAndRemovePackageCommand >> iconName [

	^ #glamorousTrash
]
