Class {
	#name : 'IceTipDescriptionDecoratorModified',
	#superclass : 'IceTipDescriptionDecorator',
	#category : 'Iceberg-TipUI-Model',
	#package : 'Iceberg-TipUI',
	#tag : 'Model'
}

{ #category : 'accessing' }
IceTipDescriptionDecoratorModified >> color [ 

	^ Smalltalk ui theme successTextColor
]
