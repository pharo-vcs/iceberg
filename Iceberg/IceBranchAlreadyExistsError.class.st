Class {
	#name : 'IceBranchAlreadyExistsError',
	#superclass : 'IceError',
	#instVars : [
		'branchName'
	],
	#category : 'Iceberg-Errors',
	#package : 'Iceberg',
	#tag : 'Errors'
}

{ #category : 'accessing' }
IceBranchAlreadyExistsError >> branchName [

	^ branchName
]

{ #category : 'accessing' }
IceBranchAlreadyExistsError >> branchName: anObject [

	branchName := anObject
]
