Class {
	#name : 'IceMetacelloNoProjectSourceNoPropertiesFiletree',
	#superclass : 'IceMetacelloIntegrationTests',
	#category : 'Iceberg-Tests-MetacelloIntegration',
	#package : 'Iceberg-Tests-MetacelloIntegration'
}

{ #category : 'testing' }
IceMetacelloNoProjectSourceNoPropertiesFiletree class >> commitishOptions [

	^	{	'/src'. "Without commitish"
			':forBecomeWriteable/src'. "With branch"
			':1.2.3/src'. "with tag"
			':087ae347c6c09bf12734e2a52d0e760f5e3eb4d3/src'. "with Commit"}


]

{ #category : 'testing' }
IceMetacelloNoProjectSourceNoPropertiesFiletree class >> commitishToUse [

	^ CommitishToUse ifNil: [ '/src' ]
]

{ #category : 'configuring' }
IceMetacelloNoProjectSourceNoPropertiesFiletree >> expectedFileFormat [
	^ IceLibgitFiletreeWriter
]

{ #category : 'configuring' }
IceMetacelloNoProjectSourceNoPropertiesFiletree >> hasProject [
	
	^ true
]

{ #category : 'configuring' }
IceMetacelloNoProjectSourceNoPropertiesFiletree >> repositoryName [

	^ 'test-noproject-source-noproperties-filetree'
]

{ #category : 'configuring' }
IceMetacelloNoProjectSourceNoPropertiesFiletree >> shouldBeDirty [
	
	^ true
]
