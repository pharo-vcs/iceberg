"
Syncs the image changes with the file system. Ensures that all changes to classes and methods are reflected in the Git repository’s working directory. It does not execute any staging (git add) nor commits.
"
Class {
	#name : 'IceTipWriteToFilesAction',
	#superclass : 'IceTipAction',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'executing' }
IceTipWriteToFilesAction >> basicExecute [

	| aDiff |
	aDiff := context workingCopyModel diffToReferenceCommit.

	context workingCopyModel repository index
		updateDiskWorkingCopy: aDiff diff;
		updateIndex: aDiff diff
]
