Class {
	#name : #IceTipTreeTag,
	#superclass : #IceTipTreeItem,
	#category : #'Iceberg-TipUI-View-DataSource'
}

{ #category : #testing }
IceTipTreeTag >> canActivateCommand: aCommandClass [
	^ aCommandClass actsOnTag: self
]
