"
Command that removes a package from the repository, without removing it from the system.
"
Class {
	#name : #IceTipRemoveFromRepositoryPackageCommand,
	#superclass : #IceTipPackageCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipRemoveFromRepositoryPackageCommand class >> defaultDescription [

	^ 'Removes the current repository from the repository, without removing it from the system'
]

{ #category : #accessing }
IceTipRemoveFromRepositoryPackageCommand class >> defaultName [

	^ 'Remove from repository'
]

{ #category : #execution }
IceTipRemoveFromRepositoryPackageCommand >> execute [

	self packageModel remove
]

{ #category : #accessing }
IceTipRemoveFromRepositoryPackageCommand >> iconName [

	^ #glamorousTrash
]
