Class {
	#name : #IceCypressPropertiesChange,
	#superclass : #IceChange,
	#category : #'Iceberg-Changes'
}

{ #category : #visiting }
IceCypressPropertiesChange >> accept: anIceChangeImporter [ 
	
	anIceChangeImporter visitCypressPropertiesChange: self
]

{ #category : #displaying }
IceCypressPropertiesChange >> displayingProgressString [
	^ 'Comparing Cypress changes'
]
