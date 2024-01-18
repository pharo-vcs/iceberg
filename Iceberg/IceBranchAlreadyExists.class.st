Class {
	#name : 'IceBranchAlreadyExists',
	#superclass : 'IceError',
	#instVars : [
		'branchName'
	],
	#category : 'Iceberg-Errors',
	#package : 'Iceberg',
	#tag : 'Errors'
}

{ #category : 'accessing' }
IceBranchAlreadyExists >> branchName [

	^ branchName
]

{ #category : 'accessing' }
IceBranchAlreadyExists >> branchName: aBranchName [

	branchName := aBranchName
]
