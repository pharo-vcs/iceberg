Class {
	#name : 'IceCypressPropertiesChange',
	#superclass : 'IceChange',
	#category : 'Iceberg-Changes',
	#package : 'Iceberg',
	#tag : 'Changes'
}

{ #category : 'visiting' }
IceCypressPropertiesChange >> accept: anIceChangeImporter [ 
	
	anIceChangeImporter visitCypressPropertiesChange: self
]

{ #category : 'displaying' }
IceCypressPropertiesChange >> displayingProgressString [
	^ 'Comparing Cypress changes'
]
