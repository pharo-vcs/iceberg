"
A basic project is the project defined in a .project file.
It contains properties like sourceDirectory, format and tags.
"
Class {
	#name : 'IceBasicProject',
	#superclass : 'IceAbstractProject',
	#instVars : [
		'properties'
	],
	#category : 'Iceberg-Project',
	#package : 'Iceberg',
	#tag : 'Project'
}

{ #category : 'instance creation' }
IceBasicProject class >> onProperties: properties commitish: aCommitish [
	
	^ self basicNew
		properties: properties;
		commitish: aCommitish;
		initialize;
		yourself
]

{ #category : 'instance creation' }
IceBasicProject class >> onRepository: aRepository [
	
	^ self basicNew
		properties: Dictionary new;
		commitish: aRepository workingCopy;
		initialize;
		yourself
]

{ #category : 'instance creation' }
IceBasicProject class >> onRepository: aRepository withSourceDirectory: aDirectory [
	
	^ self basicNew
		properties: Dictionary new;
		commitish: aRepository workingCopy;
		sourceDirectory: aDirectory;
		initialize;
		yourself
]

{ #category : 'comparing' }
IceBasicProject >> = anotherProject [

	self species = anotherProject species ifFalse: [ ^ false ].
	properties = anotherProject properties ifFalse: [ ^ false ].
	self repository = anotherProject repository ifFalse: [ ^ false ]. 

	^ true.
]

{ #category : 'writing' }
IceBasicProject >> addProjectFileToChangeBuilder: anIceChangeImporter [ 
	
	| projectFileName |
	self isUnborn ifTrue: [ ^ self ].
	
	self assert: self projectFilePath size = 1.
	projectFileName := self projectFilePath segments first.
	
	anIceChangeImporter
		addFileNamed: projectFileName
		path: self projectFilePath
		contents: self contentsString.
]

{ #category : 'accessing' }
IceBasicProject >> addTag: aString [

	self tags: (self tags copyWith: aString)
]

{ #category : 'writing' }
IceBasicProject >> addToChangeBuilder: anIceChangeImporter [

	self addProjectFileToChangeBuilder: anIceChangeImporter.
	"self addPropertiesFileToChangeBuilder: anIceChangeImporter."
]

{ #category : 'accessing' }
IceBasicProject >> backwardsCompatibleFormat [

	^ TIceRepositoryWriter users
		detect: #isLegacyDefault
		ifNone: [ Smalltalk at: #IceLibgitFiletreeWriter ]
]

{ #category : 'accessing' }
IceBasicProject >> commitish [
	^ commitish
]

{ #category : 'storing' }
IceBasicProject >> contentsString [

	^ ByteArray streamContents: [ :stream |
		(STONWriter on: (ZnCharacterWriteStream on: stream)) 
			prettyPrint: true;
			newLine: OSPlatform current lineEnding;
			nextPut: self properties ]
]

{ #category : 'accessing' }
IceBasicProject >> fileFormat: aFileFormat [

	self fileFormatId: aFileFormat id
]

{ #category : 'accessing' }
IceBasicProject >> fileFormatId: aFileFormat [

	self repositoryProperties fileFormatId: aFileFormat
]

{ #category : 'accessing' }
IceBasicProject >> fileSystem [
	
	^ commitish fileSystem
]

{ #category : 'comparing' }
IceBasicProject >> hash [

	^ commitish hash
]

{ #category : 'initialization' }
IceBasicProject >> initialize [
	super initialize.
"	repositoryProperties := self readProperties.
	repositoryProperties properties
		at: #format
		ifAbsent: [ 	repositoryProperties fileFormat: self backwardsCompatibleFormat ]"
]

{ #category : 'accessing' }
IceBasicProject >> name [
	
	^ self repository name
]

{ #category : 'accessing' }
IceBasicProject >> projectFileIn: aCommitish [ 
	
	^ aCommitish fileSystem resolve: self projectFilePath
]

{ #category : 'accessing' }
IceBasicProject >> projectFilePath [

	^ RelativePath with: '.project'.
]

{ #category : 'accessing' }
IceBasicProject >> projectFileReference [

	^ self projectFileIn: commitish
]

{ #category : 'accessing' }
IceBasicProject >> projectName [
	
	^ properties at: #projectName ifAbsent: [ self repository name ]
]

{ #category : 'accessing' }
IceBasicProject >> properties [

	^ properties
]

{ #category : 'accessing' }
IceBasicProject >> properties: aDictionary [

	properties := aDictionary
]

{ #category : 'accessing' }
IceBasicProject >> removeTag: aString [

	self tags: (self tags copyWithout: aString)
]

{ #category : 'accessing' }
IceBasicProject >> repositoryProperties [
	^ self repository properties
]

{ #category : 'accessing' }
IceBasicProject >> sourceDirectory [
	
	^ properties at: 'srcDirectory' ifAbsent: [ 'src' ]
]

{ #category : 'accessing' }
IceBasicProject >> sourceDirectory: aString [ 
	
	properties at: 'srcDirectory' put: aString
]

{ #category : 'accessing' }
IceBasicProject >> tags [

	^ self properties 
		at: #tags
		ifAbsent: [ #() ]
]

{ #category : 'accessing' }
IceBasicProject >> tags: anArray [

	self properties
		at: #tags
		put: anArray
]
