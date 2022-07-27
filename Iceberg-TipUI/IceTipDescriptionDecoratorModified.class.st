Class {
	#name : #IceTipDescriptionDecoratorModified,
	#superclass : #IceTipDescriptionDecorator,
	#category : #'Iceberg-TipUI-Model'
}

{ #category : #accessing }
IceTipDescriptionDecoratorModified >> color [ 

	^ Smalltalk ui theme successTextColor
]
