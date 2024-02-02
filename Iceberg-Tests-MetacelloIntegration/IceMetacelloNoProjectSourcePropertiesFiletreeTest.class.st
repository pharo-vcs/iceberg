Class {
	#name : 'IceMetacelloNoProjectSourcePropertiesFiletreeTest',
	#superclass : 'IceMetacelloIntegrationTest',
	#category : 'Iceberg-Tests-MetacelloIntegration',
	#package : 'Iceberg-Tests-MetacelloIntegration'
}

{ #category : 'testing' }
IceMetacelloNoProjectSourcePropertiesFiletreeTest class >> commitishOptions [

	^	{	'/src'. "Without commitish"
			':forBecomeWriteable/src'. "With branch"
			':1.2.3/src'. "with tag"
			':cd13a37e6fe64fc2701a2b37e8a058e6bcf77c5b/src'. "with Commit"}


]

{ #category : 'testing' }
IceMetacelloNoProjectSourcePropertiesFiletreeTest class >> commitishToUse [

	^ CommitishToUse ifNil: [ '/src' ]
]

{ #category : 'configuring' }
IceMetacelloNoProjectSourcePropertiesFiletreeTest >> expectedFileFormat [
	^ IceLibgitFiletreeWriter
]

{ #category : 'configuring' }
IceMetacelloNoProjectSourcePropertiesFiletreeTest >> hasProject [
	
	^ true
]

{ #category : 'configuring' }
IceMetacelloNoProjectSourcePropertiesFiletreeTest >> repositoryName [

	^ 'test-noproject-source-properties-filetree'
]

{ #category : 'configuring' }
IceMetacelloNoProjectSourcePropertiesFiletreeTest >> shouldBeDirty [
	
	^ true
]
