Class {
	#name : #IceMetacelloNoProjectSourcePropertiesTonel,
	#superclass : #IceMetacelloIntegrationTests,
	#category : 'Iceberg-Tests-MetacelloIntegration'
}

{ #category : #testing }
IceMetacelloNoProjectSourcePropertiesTonel class >> commitishOptions [

	^	{	'/src'. "Without commitish"
			':forBecomeWriteable/src'. "With branch"
			':1.2.3/src'. "with tag"
			':1d17f0b8f35cc38f1782acf9ad2c3190daa62c7f/src'. "with Commit"}


]

{ #category : #testing }
IceMetacelloNoProjectSourcePropertiesTonel class >> commitishToUse [

	^ CommitishToUse ifNil: [ '/src' ]
]

{ #category : #configuring }
IceMetacelloNoProjectSourcePropertiesTonel >> expectedFileFormat [
	^ IceLibgitTonelWriter
]

{ #category : #configuring }
IceMetacelloNoProjectSourcePropertiesTonel >> hasProject [
	
	^ true
]

{ #category : #configuring }
IceMetacelloNoProjectSourcePropertiesTonel >> repositoryName [

	^ 'test-noproject-source-properties-tonel'
]

{ #category : #configuring }
IceMetacelloNoProjectSourcePropertiesTonel >> shouldBeDirty [
	
	^ true
]
