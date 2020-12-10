"
Abstract class representing commands to be applied on top of packages.
"
Class {
	#name : #IceTipPackageCommand2,
	#superclass : #IceTipCommand2,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipPackageCommand2 class >> isAbstract [

	^ self == IceTipPackageCommand2
]

{ #category : #accessing }
IceTipPackageCommand2 >> package [

	^ self packageModel entity
]

{ #category : #accessing }
IceTipPackageCommand2 >> packageModel [

	^ self context packageModel
]
