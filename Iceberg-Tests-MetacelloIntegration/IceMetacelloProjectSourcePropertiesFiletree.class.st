Class {
	#name : #IceMetacelloProjectSourcePropertiesFiletree,
	#superclass : #IceMetacelloIntegrationTests,
	#category : 'Iceberg-Tests-MetacelloIntegration'
}

{ #category : #testing }
IceMetacelloProjectSourcePropertiesFiletree class >> commitishOptions [

	^	super commitishOptions , {	
			':30c9f38109f437d184b4017e7d9da9d953266e8b'. "With commit" 
			"Adding the src directory"
			'/src'. "Without commitish"
			':forBecomeWriteable/src'. "With branch"
			':1.2.3/src'. "with tag"
			':30c9f38109f437d184b4017e7d9da9d953266e8b/src'. "With commit" }




]

{ #category : #configuring }
IceMetacelloProjectSourcePropertiesFiletree >> expectedFileFormat [
	^ IceLibgitFiletreeWriter
]

{ #category : #configuring }
IceMetacelloProjectSourcePropertiesFiletree >> hasProject [
	
	^ true
]

{ #category : #configuring }
IceMetacelloProjectSourcePropertiesFiletree >> repositoryName [

	^ 'test-project-source-properties-filetree'
]

{ #category : #configuring }
IceMetacelloProjectSourcePropertiesFiletree >> shouldBeDirty [
	
	^ false
]
