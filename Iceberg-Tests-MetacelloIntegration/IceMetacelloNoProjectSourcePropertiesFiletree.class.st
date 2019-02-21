Class {
	#name : #IceMetacelloNoProjectSourcePropertiesFiletree,
	#superclass : #IceMetacelloIntegrationTests,
	#category : 'Iceberg-Tests-MetacelloIntegration'
}

{ #category : #testing }
IceMetacelloNoProjectSourcePropertiesFiletree class >> commitishOptions [

	^	{	'/src'. "Without commitish"
			':forBecomeWriteable/src'. "With branch"
			':1.2.3/src'. "with tag"
			':cd13a37e6fe64fc2701a2b37e8a058e6bcf77c5b/src'. "with Commit"}


]

{ #category : #testing }
IceMetacelloNoProjectSourcePropertiesFiletree class >> commitishToUse [

	^ CommitishToUse ifNil: [ '/src' ]
]

{ #category : #configuring }
IceMetacelloNoProjectSourcePropertiesFiletree >> expectedFileFormat [
	^ IceLibgitFiletreeWriter
]

{ #category : #configuring }
IceMetacelloNoProjectSourcePropertiesFiletree >> hasProject [
	
	^ true
]

{ #category : #configuring }
IceMetacelloNoProjectSourcePropertiesFiletree >> repositoryName [

	^ 'test-noproject-source-properties-filetree'
]

{ #category : #configuring }
IceMetacelloNoProjectSourcePropertiesFiletree >> shouldBeDirty [
	
	^ true
]
