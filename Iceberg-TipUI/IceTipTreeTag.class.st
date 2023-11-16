Class {
	#name : 'IceTipTreeTag',
	#superclass : 'IceTipTreeItem',
	#category : 'Iceberg-TipUI-View-Repository',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Repository'
}

{ #category : 'testing' }
IceTipTreeTag >> canActivateCommand: aCommandClass [
	^ aCommandClass actsOnTag: self
]
