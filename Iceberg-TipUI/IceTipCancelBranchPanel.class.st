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

{ #category : 'actions' }
IceTipCancelBranchPanel >> doAccept [

	^ nil
]

{ #category : 'accessing' }
IceTipCancelBranchPanel >> icon [

	^ self iconNamed: #cancel
]

{ #category : 'accessing' }
IceTipCancelBranchPanel >> windowTitle [

	^ 'Cancel'
]
