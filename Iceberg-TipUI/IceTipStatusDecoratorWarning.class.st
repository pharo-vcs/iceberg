Class {
	#name : #IceTipStatusDecoratorWarning,
	#superclass : #IceTipStatusDecorator,
	#category : #'Iceberg-TipUI-Model'
}

{ #category : #accessing }
IceTipStatusDecoratorWarning >> color [

	^ Smalltalk ui theme warningTextColor
]
