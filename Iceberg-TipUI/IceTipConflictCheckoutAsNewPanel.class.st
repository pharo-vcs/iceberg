"
I'm a panel to checkout a remote as a new branch.
"
Class {
	#name : 'IceTipConflictCheckoutAsNewPanel',
	#superclass : 'IceTipCheckoutNewBranchPanel',
	#instVars : [
		'existingBranch',
		'remoteBranch'
	],
	#category : 'Iceberg-TipUI-View-Branch',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Branch'
}

{ #category : 'actions' }
IceTipConflictCheckoutAsNewPanel >> accept [

	self executeFor: remoteBranch localBranch: existingBranch inRepository: self repository
]

{ #category : 'action' }
IceTipConflictCheckoutAsNewPanel >> executeFor: aRemoteBranch localBranch: aLocalBranch inRepository: aRepository [

	| newBranch |
	
	self validate.
	newBranch := aRepository createBranch: self branchName inCommit: remoteBranch commit.

	^ newBranch
]

{ #category : 'accessing' }
IceTipConflictCheckoutAsNewPanel >> existingBranch: aBranch [

	existingBranch := aBranch
]

{ #category : 'accessing' }
IceTipConflictCheckoutAsNewPanel >> icon [

	^ self iconNamed: #smallNew
]

{ #category : 'accessing' }
IceTipConflictCheckoutAsNewPanel >> remoteBranch: aRemoteBranch [

	remoteBranch := aRemoteBranch
]

{ #category : 'accessing' }
IceTipConflictCheckoutAsNewPanel >> repository [

	^ self model repository
]

{ #category : 'accessing' }
IceTipConflictCheckoutAsNewPanel >> windowTitle [

	^ 'Checkout remote as new branch'
]
