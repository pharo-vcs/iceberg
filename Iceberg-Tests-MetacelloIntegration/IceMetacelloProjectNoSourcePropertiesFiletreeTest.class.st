Class {
	#name : 'IceMetacelloProjectNoSourcePropertiesFiletreeTest',
	#superclass : 'IceMetacelloIntegrationTest',
	#category : 'Iceberg-Tests-MetacelloIntegration',
	#package : 'Iceberg-Tests-MetacelloIntegration'
}

{ #category : 'testing' }
IceMetacelloProjectNoSourcePropertiesFiletreeTest class >> commitishOptions [

	^	super commitishOptions , {	':61024d7e81eac0b752ade9f3e03f6e2bd34ee5bf' "With commit"}


]

{ #category : 'configuring' }
IceMetacelloProjectNoSourcePropertiesFiletreeTest >> expectedFileFormat [
	^ IceLibgitFiletreeWriter
]

{ #category : 'configuring' }
IceMetacelloProjectNoSourcePropertiesFiletreeTest >> hasProject [
	
	^ true
]

{ #category : 'configuring' }
IceMetacelloProjectNoSourcePropertiesFiletreeTest >> repositoryName [

	^ 'test-project-nosource-properties-filetree'
]

{ #category : 'configuring' }
IceMetacelloProjectNoSourcePropertiesFiletreeTest >> shouldBeDirty [
	
	^ false
]
