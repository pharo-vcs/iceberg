"
Command that reloads the code of an already loaded package, discarding all changes done in the meantime that were not committed.
"
Class {
	#name : #IceTipReloadPackageCommand,
	#superclass : #IceTipPackageCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipReloadPackageCommand class >> defaultDescription [

	^ 'Reload selected package, discarding all changes.'
]

{ #category : #accessing }
IceTipReloadPackageCommand class >> defaultName [

	^ 'Reload'
]

{ #category : #testing }
IceTipReloadPackageCommand >> canBeExecuted [

	^ self isPackageLoaded
]

{ #category : #execution }
IceTipReloadPackageCommand >> execute [

	self packageModel reload.
	Iceberg announcer announce:
		(IceRepositoryModified for: self repositoryModel entity)
]

{ #category : #accessing }
IceTipReloadPackageCommand >> iconName [

	^ #refresh
]
