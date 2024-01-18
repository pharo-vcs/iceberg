"
A branch was not found.
"
Class {
	#name : 'IceBranchNotFound',
	#superclass : 'IceError',
	#instVars : [
		'branchName'
	],
	#category : 'Iceberg-Libgit-Exceptions',
	#package : 'Iceberg-Libgit',
	#tag : 'Exceptions'
}

{ #category : 'accessing' }
IceBranchNotFound >> branchName [
	^ branchName
]

{ #category : 'accessing' }
IceBranchNotFound >> branchName: aString [ 
	branchName := aString
]
