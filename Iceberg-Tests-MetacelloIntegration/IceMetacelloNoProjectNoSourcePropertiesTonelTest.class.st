Class {
	#name : 'IceMetacelloNoProjectNoSourcePropertiesTonelTest',
	#superclass : 'IceMetacelloIntegrationTest',
	#category : 'Iceberg-Tests-MetacelloIntegration',
	#package : 'Iceberg-Tests-MetacelloIntegration'
}

{ #category : 'testing' }
IceMetacelloNoProjectNoSourcePropertiesTonelTest class >> commitishOptions [

	^	super commitishOptions , {	':e29c9ff7ef370ea7349d25d79edf9823488d33e2' "With commit"}


]

{ #category : 'configuring' }
IceMetacelloNoProjectNoSourcePropertiesTonelTest >> expectedFileFormat [

	^ IceLibgitTonelWriter
]

{ #category : 'configuring' }
IceMetacelloNoProjectNoSourcePropertiesTonelTest >> hasProject [
	
	^ true
]

{ #category : 'configuring' }
IceMetacelloNoProjectNoSourcePropertiesTonelTest >> repositoryName [

	^ 'test-noproject-nosource-properties-tonel'
]

{ #category : 'configuring' }
IceMetacelloNoProjectNoSourcePropertiesTonelTest >> shouldBeDirty [
	
	^ true
]
