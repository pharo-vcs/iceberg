Class {
	#name : 'IceMetacelloNoProjectNoSourcePropertiesTonel',
	#superclass : 'IceMetacelloIntegrationTests',
	#category : 'Iceberg-Tests-MetacelloIntegration',
	#package : 'Iceberg-Tests-MetacelloIntegration'
}

{ #category : 'testing' }
IceMetacelloNoProjectNoSourcePropertiesTonel class >> commitishOptions [

	^	super commitishOptions , {	':e29c9ff7ef370ea7349d25d79edf9823488d33e2' "With commit"}


]

{ #category : 'configuring' }
IceMetacelloNoProjectNoSourcePropertiesTonel >> expectedFileFormat [

	^ IceLibgitTonelWriter
]

{ #category : 'configuring' }
IceMetacelloNoProjectNoSourcePropertiesTonel >> hasProject [
	
	^ true
]

{ #category : 'configuring' }
IceMetacelloNoProjectNoSourcePropertiesTonel >> repositoryName [

	^ 'test-noproject-nosource-properties-tonel'
]

{ #category : 'configuring' }
IceMetacelloNoProjectNoSourcePropertiesTonel >> shouldBeDirty [
	
	^ true
]
