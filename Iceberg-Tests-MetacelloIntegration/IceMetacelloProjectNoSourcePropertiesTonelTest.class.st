Class {
	#name : 'IceMetacelloProjectNoSourcePropertiesTonelTest',
	#superclass : 'IceMetacelloIntegrationTest',
	#category : 'Iceberg-Tests-MetacelloIntegration',
	#package : 'Iceberg-Tests-MetacelloIntegration'
}

{ #category : 'testing' }
IceMetacelloProjectNoSourcePropertiesTonelTest class >> commitishOptions [

	^	super commitishOptions , {	':06f2b9e4833d38770b11c9126987266a3d757843' "With commit"}


]

{ #category : 'configuring' }
IceMetacelloProjectNoSourcePropertiesTonelTest >> expectedFileFormat [
	^ IceLibgitTonelWriter
]

{ #category : 'configuring' }
IceMetacelloProjectNoSourcePropertiesTonelTest >> hasProject [
	
	^ true
]

{ #category : 'configuring' }
IceMetacelloProjectNoSourcePropertiesTonelTest >> repositoryName [

	^ 'test-project-nosource-properties-tonel'
]

{ #category : 'configuring' }
IceMetacelloProjectNoSourcePropertiesTonelTest >> shouldBeDirty [
	
	^ false
]
