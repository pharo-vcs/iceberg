"
I'm a plugin to add Metacello extensions into IceTip UI.
"
Class {
	#name : 'IceTipMetacelloPlugin',
	#superclass : 'IcePlugin',
	#category : 'Iceberg-Plugin-Metacello',
	#package : 'Iceberg-Plugin-Metacello'
}

{ #category : 'testing' }
IceTipMetacelloPlugin class >> isAvailableFor: aRepository [
	^ true
]
