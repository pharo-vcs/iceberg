Class {
	#name : 'IceTipCancelBranchPanel',
	#superclass : 'IceTipBranchPanel',
	#instVars : [
		'title',
		'icon'
	],
	#category : 'Iceberg-TipUI-View-Branch',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Branch'
}

{ #category : 'layout' }
IceTipCancelBranchPanel >> defaultLayout [

	^ SpBoxLayout newLeftToRight yourself
]

{ #category : 'action' }
IceTipCancelBranchPanel >> executeFor: remoteBranch localBranch: localBranch inRepository: aRepository [
	"Return nil to indicate cancellation"

	^ nil
]

{ #category : 'accessing' }
IceTipCancelBranchPanel >> icon [

	^ self iconNamed: #cancel
]

{ #category : 'initialization' }
IceTipCancelBranchPanel >> windowIcon [

	^ self icon
]

{ #category : 'accessing' }
IceTipCancelBranchPanel >> windowTitle [

	^ 'Cancel checkout operation'
]
