Class {
	#name : #IceTipDescriptionDecoratorNotLoaded,
	#superclass : #IceTipDescriptionDecorator,
	#category : #'Iceberg-TipUI-Model'
}

{ #category : #accessing }
IceTipDescriptionDecoratorNotLoaded >> color [

	^ Smalltalk ui theme disabledTextColor
]
