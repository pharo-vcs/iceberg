Class {
	#name : 'IceTipDescriptionDecoratorNotLoaded',
	#superclass : 'IceTipDescriptionDecorator',
	#category : 'Iceberg-TipUI-Model',
	#package : 'Iceberg-TipUI',
	#tag : 'Model'
}

{ #category : 'accessing' }
IceTipDescriptionDecoratorNotLoaded >> color [

	^ Smalltalk ui theme disabledTextColor
]
