Class {
	#name : 'IceTipTreeBranch',
	#superclass : 'IceTipTreeItem',
	#category : 'Iceberg-TipUI-View-Repository',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Repository'
}

{ #category : 'testing' }
IceTipTreeBranch >> canActivateCommand: aCommandClass [
	^ aCommandClass actsOnBranch: self
]
