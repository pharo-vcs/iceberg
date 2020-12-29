"
Command that loads the current non-loaded selected package
"
Class {
	#name : #IceTipLoadPackageCommand,
	#superclass : #IceTipPackageCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipLoadPackageCommand class >> defaultDescription [

	^ 'Load selected package in the image'
]

{ #category : #accessing }
IceTipLoadPackageCommand class >> defaultName [

	^ 'Load'
]

{ #category : #testing }
IceTipLoadPackageCommand >> canBeExecuted [

	^ self isPackageLoaded not
]

{ #category : #execution }
IceTipLoadPackageCommand >> execute [

	self packageModel load.
	Iceberg announcer announce:
		(IceRepositoryModified for: self repositoryModel entity)
]

{ #category : #accessing }
IceTipLoadPackageCommand >> iconName [

	^ #add
]
