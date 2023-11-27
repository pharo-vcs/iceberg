"
Command that browses the selected package as it is loaded in the image.
"
Class {
	#name : 'IceTipBrowsePackageCommand',
	#superclass : 'IceTipPackageCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipBrowsePackageCommand class >> defaultDescription [

	^ 'Browse the selected package as it is loaded in the image'
]

{ #category : 'accessing - defaults' }
IceTipBrowsePackageCommand class >> defaultName [

	^ 'Browse'
]

{ #category : 'testing' }
IceTipBrowsePackageCommand >> canBeExecuted [

	^ super canBeExecuted and: [ self isPackageLoaded ]
]

{ #category : 'executing' }
IceTipBrowsePackageCommand >> execute [

	self packageModel browsePackage
]

{ #category : 'accessing' }
IceTipBrowsePackageCommand >> shortcutKey [

	^ $b meta
]
