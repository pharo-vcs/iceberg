"
Command that opens a browser on the code of the repository.

The current implementation relies on a monticello MCSnapshotBrowser
"
Class {
	#name : 'IceTipBrowseRepositoryPackageVersionCommand',
	#superclass : 'IceTipPackageCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipBrowseRepositoryPackageVersionCommand class >> defaultDescription [

	^ 'Browse the version in the repository'
]

{ #category : 'accessing - defaults' }
IceTipBrowseRepositoryPackageVersionCommand class >> defaultName [

	^ 'Browse this version in Monticello'
]

{ #category : 'executing' }
IceTipBrowseRepositoryPackageVersionCommand >> execute [

	self packageModel browseRepositoryVersion
]
