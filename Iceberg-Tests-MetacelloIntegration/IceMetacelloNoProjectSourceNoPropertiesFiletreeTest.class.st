Class {
	#name : 'IceMetacelloNoProjectSourceNoPropertiesFiletreeTest',
	#superclass : 'IceMetacelloIntegrationTest',
	#category : 'Iceberg-Tests-MetacelloIntegration',
	#package : 'Iceberg-Tests-MetacelloIntegration'
}

{ #category : 'testing' }
IceMetacelloNoProjectSourceNoPropertiesFiletreeTest class >> commitishOptions [

	^	{	'/src'. "Without commitish"
			':forBecomeWriteable/src'. "With branch"
			':1.2.3/src'. "with tag"
			':087ae347c6c09bf12734e2a52d0e760f5e3eb4d3/src'. "with Commit"}


]

{ #category : 'testing' }
IceMetacelloNoProjectSourceNoPropertiesFiletreeTest class >> commitishToUse [

	^ CommitishToUse ifNil: [ '/src' ]
]

{ #category : 'configuring' }
IceMetacelloNoProjectSourceNoPropertiesFiletreeTest >> expectedFileFormat [
	^ IceLibgitFiletreeWriter
]

{ #category : 'configuring' }
IceMetacelloNoProjectSourceNoPropertiesFiletreeTest >> hasProject [
	
	^ true
]

{ #category : 'configuring' }
IceMetacelloNoProjectSourceNoPropertiesFiletreeTest >> repositoryName [

	^ 'test-noproject-source-noproperties-filetree'
]

{ #category : 'configuring' }
IceMetacelloNoProjectSourceNoPropertiesFiletreeTest >> shouldBeDirty [
	
	^ true
]
