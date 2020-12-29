"
Command that browses the selected package as it is loaded in the image.
"
Class {
	#name : #IceTipBrowsePackageCommand,
	#superclass : #IceTipPackageCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipBrowsePackageCommand class >> defaultDescription [

	^ 'Browse the selected package as it is loaded in the image'
]

{ #category : #accessing }
IceTipBrowsePackageCommand class >> defaultName [

	^ 'Browse'
]

{ #category : #testing }
IceTipBrowsePackageCommand >> canBeExecuted [

	^ self isPackageLoaded
]

{ #category : #execution }
IceTipBrowsePackageCommand >> execute [

	self packageModel browsePackage
]

{ #category : #accessing }
IceTipBrowsePackageCommand >> shortcutKey [

	^ $b meta
]
