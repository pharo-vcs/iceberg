"
Provides common behavior to accesing the packages list presenters in its context.
"
Class {
	#name : 'IceTipSelectPackagesCommand',
	#superclass : 'IceTipPackageCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'executing' }
IceTipSelectPackagesCommand >> packagesList [
	" Answer a <SpTablePresenter> including the receiver's packages "
	
	^ self context packagesList
]
