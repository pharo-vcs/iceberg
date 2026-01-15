"
I'm a panel to cancel a checkout branch action.
"
Class {
	#name : 'IceTipCancelBranchPanel',
	#superclass : 'IceTipBranchPanel',
	#instVars : [
		'title',
		'icon',
		'remoteBranch',
		'existingBranch'
	],
	#category : 'Iceberg-TipUI-View-Branch',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Branch'
}

{ #category : 'actions' }
IceTipCancelBranchPanel >> accept [

	self executeFor: remoteBranch localBranch: existingBranch inRepository: self repository
]

{ #category : 'layout' }
IceTipCancelBranchPanel >> defaultLayout [

	^ SpBoxLayout newLeftToRight yourself
]

{ #category : 'action' }
IceTipCancelBranchPanel >> executeFor: aRemoteBranch localBranch: aLocalBranch inRepository: aRepository [
	"Return nil to indicate cancellation"

	^ nil
]

{ #category : 'accessing' }
IceTipCancelBranchPanel >> existingBranch: aBranch [

	existingBranch := aBranch 
]

{ #category : 'accessing' }
IceTipCancelBranchPanel >> icon [

	^ self iconNamed: #cancel
]

{ #category : 'accessing' }
IceTipCancelBranchPanel >> remoteBranch: aRemoteBranch [

	remoteBranch := aRemoteBranch
]

{ #category : 'accessing' }
IceTipCancelBranchPanel >> repository [

	^ self model repository
]

{ #category : 'initialization' }
IceTipCancelBranchPanel >> windowIcon [

	^ self icon
]

{ #category : 'accessing' }
IceTipCancelBranchPanel >> windowTitle [

	^ 'Cancel checkout operation'
]
