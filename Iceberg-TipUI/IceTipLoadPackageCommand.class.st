"
Command that loads the current non-loaded selected package
"
Class {
	#name : 'IceTipLoadPackageCommand',
	#superclass : 'IceTipPackageCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipLoadPackageCommand class >> defaultDescription [

	^ 'Load selected package in the image'
]

{ #category : 'accessing - defaults' }
IceTipLoadPackageCommand class >> defaultName [

	^ 'Load'
]

{ #category : 'testing' }
IceTipLoadPackageCommand >> canBeExecuted [

	^ self isPackageLoaded not
]

{ #category : 'executing' }
IceTipLoadPackageCommand >> execute [

	self packageModel newLoadAction executeWithContext: self context
]

{ #category : 'accessing' }
IceTipLoadPackageCommand >> iconName [

	^ #add
]
