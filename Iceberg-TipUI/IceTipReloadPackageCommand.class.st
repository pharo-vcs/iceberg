"
Command that reloads the code of an already loaded package, discarding all changes done in the meantime that were not committed.
"
Class {
	#name : 'IceTipReloadPackageCommand',
	#superclass : 'IceTipPackageCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipReloadPackageCommand class >> defaultDescription [

	^ 'Reload selected package, discarding all changes.'
]

{ #category : 'accessing - defaults' }
IceTipReloadPackageCommand class >> defaultName [

	^ 'Reload'
]

{ #category : 'testing' }
IceTipReloadPackageCommand >> canBeExecuted [

	^ self isPackageLoaded
]

{ #category : 'executing' }
IceTipReloadPackageCommand >> execute [

	self packageModel newReloadAction executeWithContext: self context.
]

{ #category : 'accessing' }
IceTipReloadPackageCommand >> iconName [

	^ #refresh
]
