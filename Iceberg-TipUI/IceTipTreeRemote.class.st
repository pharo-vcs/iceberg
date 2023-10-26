Class {
	#name : 'IceTipTreeRemote',
	#superclass : 'IceTipTreeGroup',
	#category : 'Iceberg-TipUI-View-Repository',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Repository'
}

{ #category : 'testing' }
IceTipTreeRemote >> canActivateCommand: aCommandClass [
	^ aCommandClass actsOnRemote: self
]
