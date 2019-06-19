Class {
	#name : #IceMetacelloNoProjectNoSourcePropertiesFiletree,
	#superclass : #IceMetacelloIntegrationTests,
	#category : 'Iceberg-Tests-MetacelloIntegration'
}

{ #category : #testing }
IceMetacelloNoProjectNoSourcePropertiesFiletree class >> commitishOptions [

	^	super commitishOptions , {	':06d29d26ac71072a49f1846f73f5389a89ebc455' "With commit"}


]

{ #category : #configuring }
IceMetacelloNoProjectNoSourcePropertiesFiletree >> expectedFileFormat [

	^ IceLibgitFiletreeWriter
]

{ #category : #configuring }
IceMetacelloNoProjectNoSourcePropertiesFiletree >> hasProject [
	
	^ true
]

{ #category : #configuring }
IceMetacelloNoProjectNoSourcePropertiesFiletree >> repositoryName [

	^ 'test-noproject-nosource-properties-filetree'
]

{ #category : #configuring }
IceMetacelloNoProjectNoSourcePropertiesFiletree >> shouldBeDirty [
	
	^ true
]
