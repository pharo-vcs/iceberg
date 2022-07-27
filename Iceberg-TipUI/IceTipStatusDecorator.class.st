Class {
	#name : #IceTipStatusDecorator,
	#superclass : #IceTipTextDecorator,
	#category : #'Iceberg-TipUI-Model'
}

{ #category : #accessing }
IceTipStatusDecorator class >> error [

	^ IceTipStatusDecoratorError uniqueInstance
]

{ #category : #accessing }
IceTipStatusDecorator class >> warning [

	^ IceTipStatusDecoratorWarning uniqueInstance
]
