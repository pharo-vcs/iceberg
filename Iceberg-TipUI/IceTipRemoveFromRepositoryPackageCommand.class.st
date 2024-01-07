"
Command that removes a package from the repository, without removing it from the system.
"
Class {
	#name : 'IceTipRemoveFromRepositoryPackageCommand',
	#superclass : 'IceTipPackageCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipRemoveFromRepositoryPackageCommand class >> defaultDescription [

	^ 'Removes the current repository from the repository, without removing it from the system'
]

{ #category : 'accessing - defaults' }
IceTipRemoveFromRepositoryPackageCommand class >> defaultName [

	^ 'Remove from repository'
]

{ #category : 'executing' }
IceTipRemoveFromRepositoryPackageCommand >> execute [

	self packageModel newRemoveAction executeWithContext: self context
]

{ #category : 'accessing' }
IceTipRemoveFromRepositoryPackageCommand >> iconName [

	^ #glamorousTrash
]
