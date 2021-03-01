Class {
	#name : #IceTipTreeRemote,
	#superclass : #IceTipTreeGroup,
	#category : #'Iceberg-TipUI-View-Repository'
}

{ #category : #testing }
IceTipTreeRemote >> canActivateCommand: aCommandClass [
	^ aCommandClass actsOnRemote: self
]
