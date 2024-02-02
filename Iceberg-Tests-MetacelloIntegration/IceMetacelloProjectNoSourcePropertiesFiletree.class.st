Class {
	#name : 'IceMetacelloProjectNoSourcePropertiesFiletree',
	#superclass : 'IceMetacelloIntegrationTest',
	#category : 'Iceberg-Tests-MetacelloIntegration',
	#package : 'Iceberg-Tests-MetacelloIntegration'
}

{ #category : 'testing' }
IceMetacelloProjectNoSourcePropertiesFiletree class >> commitishOptions [

	^	super commitishOptions , {	':61024d7e81eac0b752ade9f3e03f6e2bd34ee5bf' "With commit"}


]

{ #category : 'configuring' }
IceMetacelloProjectNoSourcePropertiesFiletree >> expectedFileFormat [
	^ IceLibgitFiletreeWriter
]

{ #category : 'configuring' }
IceMetacelloProjectNoSourcePropertiesFiletree >> hasProject [
	
	^ true
]

{ #category : 'configuring' }
IceMetacelloProjectNoSourcePropertiesFiletree >> repositoryName [

	^ 'test-project-nosource-properties-filetree'
]

{ #category : 'configuring' }
IceMetacelloProjectNoSourcePropertiesFiletree >> shouldBeDirty [
	
	^ false
]
