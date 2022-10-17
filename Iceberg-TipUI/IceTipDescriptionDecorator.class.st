Class {
	#name : #IceTipDescriptionDecorator,
	#superclass : #IceTipTextDecorator,
	#category : #'Iceberg-TipUI-Model'
}

{ #category : #accessing }
IceTipDescriptionDecorator class >> head [

	^ IceTipDescriptionDecoratorHead uniqueInstance
]

{ #category : #accessing }
IceTipDescriptionDecorator class >> modified [

	^ IceTipDescriptionDecoratorModified uniqueInstance
]

{ #category : #accessing }
IceTipDescriptionDecorator class >> notLoaded [

	^ IceTipDescriptionDecoratorNotLoaded uniqueInstance
]
