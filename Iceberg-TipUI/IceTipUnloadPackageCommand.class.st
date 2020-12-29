"
Command to unload a package from the system, keeping it in the repository
"
Class {
	#name : #IceTipUnloadPackageCommand,
	#superclass : #IceTipPackageCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipUnloadPackageCommand class >> defaultDescription [

	^ 'Unload selected package from the system, but keep it in the repository.'
]

{ #category : #accessing }
IceTipUnloadPackageCommand class >> defaultName [

	^ 'Unload'
]

{ #category : #testing }
IceTipUnloadPackageCommand >> canBeExecuted [

	^ self isPackageLoaded
]

{ #category : #execution }
IceTipUnloadPackageCommand >> execute [

	self packageModel unload
]

{ #category : #accessing }
IceTipUnloadPackageCommand >> iconName [

	^ #smallCancel
]
