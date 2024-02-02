Class {
	#name : 'IceMetacelloProjectSourcePropertiesTonelTest',
	#superclass : 'IceMetacelloIntegrationTest',
	#category : 'Iceberg-Tests-MetacelloIntegration',
	#package : 'Iceberg-Tests-MetacelloIntegration'
}

{ #category : 'testing' }
IceMetacelloProjectSourcePropertiesTonelTest class >> commitishOptions [

	^	super commitishOptions , {	
			':92f28a10326eaa36893e06468687a1e59bd6fb62'. "With commit" 
			"Adding the src directory"
			'/src'. "Without commitish"
			':forBecomeWriteable/src'. "With branch"
			':1.2.3/src'. "with tag"
			':92f28a10326eaa36893e06468687a1e59bd6fb62/src'. "With commit" }




]

{ #category : 'configuring' }
IceMetacelloProjectSourcePropertiesTonelTest >> expectedFileFormat [
	^ IceLibgitTonelWriter
]

{ #category : 'configuring' }
IceMetacelloProjectSourcePropertiesTonelTest >> hasProject [
	
	^ true
]

{ #category : 'configuring' }
IceMetacelloProjectSourcePropertiesTonelTest >> repositoryName [

	^ 'test-project-source-properties-tonel'
]

{ #category : 'configuring' }
IceMetacelloProjectSourcePropertiesTonelTest >> shouldBeDirty [
	
	^ false
]
