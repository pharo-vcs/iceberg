Class {
	#name : 'IceMetacelloProjectNoSourcePropertiesTonel',
	#superclass : 'IceMetacelloIntegrationTests',
	#category : 'Iceberg-Tests-MetacelloIntegration',
	#package : 'Iceberg-Tests-MetacelloIntegration'
}

{ #category : 'testing' }
IceMetacelloProjectNoSourcePropertiesTonel class >> commitishOptions [

	^	super commitishOptions , {	':06f2b9e4833d38770b11c9126987266a3d757843' "With commit"}


]

{ #category : 'configuring' }
IceMetacelloProjectNoSourcePropertiesTonel >> expectedFileFormat [
	^ IceLibgitTonelWriter
]

{ #category : 'configuring' }
IceMetacelloProjectNoSourcePropertiesTonel >> hasProject [
	
	^ true
]

{ #category : 'configuring' }
IceMetacelloProjectNoSourcePropertiesTonel >> repositoryName [

	^ 'test-project-nosource-properties-tonel'
]

{ #category : 'configuring' }
IceMetacelloProjectNoSourcePropertiesTonel >> shouldBeDirty [
	
	^ false
]
