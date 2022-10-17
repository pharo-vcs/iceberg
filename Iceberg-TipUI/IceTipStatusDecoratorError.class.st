Class {
	#name : #IceTipStatusDecoratorError,
	#superclass : #IceTipStatusDecorator,
	#category : #'Iceberg-TipUI-Model'
}

{ #category : #accessing }
IceTipStatusDecoratorError >> color [
self flag: #TODO. "Do not rely on theme, but on settings"
	^ Smalltalk ui theme dangerTextColor
]

{ #category : #testing }
IceTipStatusDecoratorError >> isBold [

	^ true
]
