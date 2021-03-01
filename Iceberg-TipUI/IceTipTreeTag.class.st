Class {
	#name : #IceTipTreeTag,
	#superclass : #IceTipTreeItem,
	#category : #'Iceberg-TipUI-View-Repository'
}

{ #category : #testing }
IceTipTreeTag >> canActivateCommand: aCommandClass [
	^ aCommandClass actsOnTag: self
]
