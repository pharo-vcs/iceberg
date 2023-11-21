Class {
	#name : 'IceTipTextDecorator',
	#superclass : 'Object',
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Iceberg-TipUI-Model',
	#package : 'Iceberg-TipUI',
	#tag : 'Model'
}

{ #category : 'instance creation' }
IceTipTextDecorator class >> new [

	self error: 'Use #uniqueInstance'
]

{ #category : 'accessing' }
IceTipTextDecorator class >> none [

	^ IceTipTextDecoratorNone uniqueInstance
]

{ #category : 'instance creation' }
IceTipTextDecorator class >> uniqueInstance [

	self = IceTipTextDecorator ifTrue: [ ^ self error: 'I''m abstract, use one of my children.' ].
	^ uniqueInstance ifNil: [ uniqueInstance := super new ]
]

{ #category : 'accessing' }
IceTipTextDecorator >> color [
self flag: #TODO. "Do not rely on theme, but on settings"
	^ Smalltalk ui theme textColor
]

{ #category : 'testing' }
IceTipTextDecorator >> isBold [

	^ false
]

{ #category : 'testing' }
IceTipTextDecorator >> isItalic [

	^ false
]
