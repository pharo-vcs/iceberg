Class {
	#name : 'IceTipTagDecorator',
	#superclass : 'IceTipTextDecorator',
	#category : 'Iceberg-TipUI-Model',
	#package : 'Iceberg-TipUI',
	#tag : 'Model'
}

{ #category : 'accessing' }
IceTipTagDecorator >> color [

	^ Smalltalk ui theme disabledColor
]

{ #category : 'testing' }
IceTipTagDecorator >> isItalic [

	^ true
]
