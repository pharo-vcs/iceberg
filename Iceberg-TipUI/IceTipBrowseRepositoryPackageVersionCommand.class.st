"
Command that opens a browser on the code of the repository.

The current implementation relies on a monticello MCSnapshotBrowser
"
Class {
	#name : #IceTipBrowseRepositoryPackageVersionCommand,
	#superclass : #IceTipPackageCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipBrowseRepositoryPackageVersionCommand class >> defaultDescription [

	^ 'Browse the version in the repository'
]

{ #category : #accessing }
IceTipBrowseRepositoryPackageVersionCommand class >> defaultName [

	^ 'Browse repository version'
]

{ #category : #execution }
IceTipBrowseRepositoryPackageVersionCommand >> execute [

	self packageModel browseRepositoryVersion
]
