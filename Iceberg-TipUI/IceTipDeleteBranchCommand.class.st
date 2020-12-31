"
Command that deletes the selected branch
"
Class {
	#name : #IceTipDeleteBranchCommand,
	#superclass : #IceTipRemotesTreeCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipDeleteBranchCommand class >> defaultDescription [

	^ 'Delete this branch for this repository'
]

{ #category : #accessing }
IceTipDeleteBranchCommand class >> defaultName [

	^ 'Delete branch'
]

{ #category : #testing }
IceTipDeleteBranchCommand >> actsOnBranch: aBranchModel [

	^ aBranchModel isLocal
]

{ #category : #execution }
IceTipDeleteBranchCommand >> execute [

	self item delete
]

{ #category : #accessing }
IceTipDeleteBranchCommand >> iconName [

	^ #delete
]
