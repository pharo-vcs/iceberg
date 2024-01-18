"
Command that deletes the selected branch
"
Class {
	#name : 'IceTipDeleteBranchCommand',
	#superclass : 'IceTipRemotesTreeCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipDeleteBranchCommand class >> defaultDescription [

	^ 'Delete this branch for this repository'
]

{ #category : 'accessing - defaults' }
IceTipDeleteBranchCommand class >> defaultName [

	^ 'Delete branch'
]

{ #category : 'testing' }
IceTipDeleteBranchCommand >> actsOnBranch: aBranchModel [

	^ aBranchModel isLocal
]

{ #category : 'executing' }
IceTipDeleteBranchCommand >> execute [

	self item newDeleteAction executeWithContext: self context
]

{ #category : 'accessing' }
IceTipDeleteBranchCommand >> iconName [

	^ #delete
]
