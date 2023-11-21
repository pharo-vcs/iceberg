Class {
	#name : 'IceMetacelloNoProjectNoSourceNoPropertiesFiletree',
	#superclass : 'IceMetacelloIntegrationTests',
	#category : 'Iceberg-Tests-MetacelloIntegration',
	#package : 'Iceberg-Tests-MetacelloIntegration'
}

{ #category : 'testing' }
IceMetacelloNoProjectNoSourceNoPropertiesFiletree class >> commitishOptions [

	^	super commitishOptions , {	':d68a059b2e36672b1103d89689412d37462b9ca2' "With commit"}


]

{ #category : 'configuring' }
IceMetacelloNoProjectNoSourceNoPropertiesFiletree >> expectedFileFormat [

	^ IceLibgitFiletreeWriter
]

{ #category : 'configuring' }
IceMetacelloNoProjectNoSourceNoPropertiesFiletree >> hasProject [
	
	^ true
]

{ #category : 'configuring' }
IceMetacelloNoProjectNoSourceNoPropertiesFiletree >> repositoryName [

	^ 'test-noproject-nosource-noproperties-filetree'
]

{ #category : 'configuring' }
IceMetacelloNoProjectNoSourceNoPropertiesFiletree >> shouldBeDirty [
	
	^ true
]
