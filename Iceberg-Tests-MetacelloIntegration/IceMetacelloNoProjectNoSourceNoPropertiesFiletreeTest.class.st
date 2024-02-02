Class {
	#name : 'IceMetacelloNoProjectNoSourceNoPropertiesFiletreeTest',
	#superclass : 'IceMetacelloIntegrationTest',
	#category : 'Iceberg-Tests-MetacelloIntegration',
	#package : 'Iceberg-Tests-MetacelloIntegration'
}

{ #category : 'testing' }
IceMetacelloNoProjectNoSourceNoPropertiesFiletreeTest class >> commitishOptions [

	^	super commitishOptions , {	':d68a059b2e36672b1103d89689412d37462b9ca2' "With commit"}


]

{ #category : 'configuring' }
IceMetacelloNoProjectNoSourceNoPropertiesFiletreeTest >> expectedFileFormat [

	^ IceLibgitFiletreeWriter
]

{ #category : 'configuring' }
IceMetacelloNoProjectNoSourceNoPropertiesFiletreeTest >> hasProject [
	
	^ true
]

{ #category : 'configuring' }
IceMetacelloNoProjectNoSourceNoPropertiesFiletreeTest >> repositoryName [

	^ 'test-noproject-nosource-noproperties-filetree'
]

{ #category : 'configuring' }
IceMetacelloNoProjectNoSourceNoPropertiesFiletreeTest >> shouldBeDirty [
	
	^ true
]
