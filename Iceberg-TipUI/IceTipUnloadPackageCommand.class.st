"
Command to unload a package from the system, keeping it in the repository
"
Class {
	#name : 'IceTipUnloadPackageCommand',
	#superclass : 'IceTipPackageCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipUnloadPackageCommand class >> defaultDescription [

	^ 'Unload selected package from the system, but keep it in the repository.'
]

{ #category : 'accessing - defaults' }
IceTipUnloadPackageCommand class >> defaultName [

	^ 'Unload'
]

{ #category : 'testing' }
IceTipUnloadPackageCommand >> canBeExecuted [

	^ self isPackageLoaded
]

{ #category : 'executing' }
IceTipUnloadPackageCommand >> execute [

	self packageModel newUnloadAction executeWithContext: self context
]

{ #category : 'accessing' }
IceTipUnloadPackageCommand >> iconName [

	^ #smallCancel
]
