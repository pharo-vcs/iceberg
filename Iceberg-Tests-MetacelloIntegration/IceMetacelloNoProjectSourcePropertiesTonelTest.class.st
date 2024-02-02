Class {
	#name : 'IceMetacelloNoProjectSourcePropertiesTonelTest',
	#superclass : 'IceMetacelloIntegrationTest',
	#category : 'Iceberg-Tests-MetacelloIntegration',
	#package : 'Iceberg-Tests-MetacelloIntegration'
}

{ #category : 'testing' }
IceMetacelloNoProjectSourcePropertiesTonelTest class >> commitishOptions [

	^	{	'/src'. "Without commitish"
			':forBecomeWriteable/src'. "With branch"
			':1.2.3/src'. "with tag"
			':1d17f0b8f35cc38f1782acf9ad2c3190daa62c7f/src'. "with Commit"}


]

{ #category : 'testing' }
IceMetacelloNoProjectSourcePropertiesTonelTest class >> commitishToUse [

	^ CommitishToUse ifNil: [ '/src' ]
]

{ #category : 'configuring' }
IceMetacelloNoProjectSourcePropertiesTonelTest >> expectedFileFormat [
	^ IceLibgitTonelWriter
]

{ #category : 'configuring' }
IceMetacelloNoProjectSourcePropertiesTonelTest >> hasProject [
	
	^ true
]

{ #category : 'configuring' }
IceMetacelloNoProjectSourcePropertiesTonelTest >> repositoryName [

	^ 'test-noproject-source-properties-tonel'
]

{ #category : 'configuring' }
IceMetacelloNoProjectSourcePropertiesTonelTest >> shouldBeDirty [
	
	^ true
]
