Class {
	#name : 'IceMetacelloNoProjectNoSourcePropertiesFiletreeTest',
	#superclass : 'IceMetacelloIntegrationTest',
	#category : 'Iceberg-Tests-MetacelloIntegration',
	#package : 'Iceberg-Tests-MetacelloIntegration'
}

{ #category : 'testing' }
IceMetacelloNoProjectNoSourcePropertiesFiletreeTest class >> commitishOptions [

	^	super commitishOptions , {	':06d29d26ac71072a49f1846f73f5389a89ebc455' "With commit"}


]

{ #category : 'configuring' }
IceMetacelloNoProjectNoSourcePropertiesFiletreeTest >> expectedFileFormat [

	^ IceLibgitFiletreeWriter
]

{ #category : 'configuring' }
IceMetacelloNoProjectNoSourcePropertiesFiletreeTest >> hasProject [
	
	^ true
]

{ #category : 'configuring' }
IceMetacelloNoProjectNoSourcePropertiesFiletreeTest >> repositoryName [

	^ 'test-noproject-nosource-properties-filetree'
]

{ #category : 'configuring' }
IceMetacelloNoProjectNoSourcePropertiesFiletreeTest >> shouldBeDirty [
	
	^ true
]
