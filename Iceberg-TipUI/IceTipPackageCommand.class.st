"
Abstract class representing commands to be applied on top of packages.
"
Class {
	#name : #IceTipPackageCommand,
	#superclass : #IceTipCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipPackageCommand class >> isAbstract [

	^ self == IceTipPackageCommand
]

{ #category : #testing }
IceTipPackageCommand >> hasPackageModel [

	^ self packageModel notNil
]

{ #category : #testing }
IceTipPackageCommand >> isPackageLoaded [ 

	^ self hasPackageModel and: [ self packageModel isLoaded ]
]

{ #category : #accessing }
IceTipPackageCommand >> package [

	^ self packageModel entity
]

{ #category : #accessing }
IceTipPackageCommand >> packageModel [

	^ self context packageModel
]
