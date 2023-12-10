"
Abstract class representing commands to be applied on top of packages.
"
Class {
	#name : 'IceTipPackageCommand',
	#superclass : 'IceTipCommand',
	#instVars : [
		'packageModel'
	],
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'testing' }
IceTipPackageCommand class >> isAbstract [

	^ self == IceTipPackageCommand
]

{ #category : 'testing' }
IceTipPackageCommand >> hasPackageModel [

	^ self packageModel isNotNil
]

{ #category : 'testing' }
IceTipPackageCommand >> isPackageLoaded [ 

	^ self hasPackageModel and: [ self packageModel isLoaded ]
]

{ #category : 'accessing' }
IceTipPackageCommand >> package [

	^ self packageModel entity
]

{ #category : 'accessing' }
IceTipPackageCommand >> packageModel [

	^ packageModel ifNil: [self context packageModel]
]

{ #category : 'accessing' }
IceTipPackageCommand >> packageModel: anIceTipPackageModel [ 

	packageModel := anIceTipPackageModel
]
