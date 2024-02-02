Class {
	#name : 'IceMetacelloProjectSourcePropertiesFiletreeTest',
	#superclass : 'IceMetacelloIntegrationTest',
	#category : 'Iceberg-Tests-MetacelloIntegration',
	#package : 'Iceberg-Tests-MetacelloIntegration'
}

{ #category : 'testing' }
IceMetacelloProjectSourcePropertiesFiletreeTest class >> commitishOptions [

	^	super commitishOptions , {	
			':30c9f38109f437d184b4017e7d9da9d953266e8b'. "With commit" 
			"Adding the src directory"
			'/src'. "Without commitish"
			':forBecomeWriteable/src'. "With branch"
			':1.2.3/src'. "with tag"
			':30c9f38109f437d184b4017e7d9da9d953266e8b/src'. "With commit" }




]

{ #category : 'configuring' }
IceMetacelloProjectSourcePropertiesFiletreeTest >> expectedFileFormat [
	^ IceLibgitFiletreeWriter
]

{ #category : 'configuring' }
IceMetacelloProjectSourcePropertiesFiletreeTest >> hasProject [
	
	^ true
]

{ #category : 'configuring' }
IceMetacelloProjectSourcePropertiesFiletreeTest >> repositoryName [

	^ 'test-project-source-properties-filetree'
]

{ #category : 'configuring' }
IceMetacelloProjectSourcePropertiesFiletreeTest >> shouldBeDirty [
	
	^ false
]
