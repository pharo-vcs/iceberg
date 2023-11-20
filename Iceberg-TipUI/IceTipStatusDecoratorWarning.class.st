Class {
	#name : 'IceTipStatusDecoratorWarning',
	#superclass : 'IceTipStatusDecorator',
	#category : 'Iceberg-TipUI-Model',
	#package : 'Iceberg-TipUI',
	#tag : 'Model'
}

{ #category : 'accessing' }
IceTipStatusDecoratorWarning >> color [

	^ Smalltalk ui theme warningTextColor
]
