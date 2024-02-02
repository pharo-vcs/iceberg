Class {
	#name : 'IceGitPropertiesFileTest',
	#superclass : 'IceAbstractTestCase',
	#category : 'Iceberg-Tests-Git',
	#package : 'Iceberg-Tests',
	#tag : 'Git'
}

{ #category : 'running' }
IceGitPropertiesFileTest >> newFixture [
	^ IceBasicRepositoryFixture inGit
]

{ #category : 'tests' }
IceGitPropertiesFileTest >> testCommitSavesPropertiesFile [
	self repository properties
		at: #bla put: #blo.
	self repository commitWithMessage: 'add properties'.
		
	self assert: (self repository head properties at: #bla) equals: #blo
]

{ #category : 'tests' }
IceGitPropertiesFileTest >> testPropertiesFileIsStoredInMemory [

	self repository properties
		at: #bla put: #blo.
		
	self deny: (self repository codeDirectory / '.properties') exists.
	self assert: (self repository properties at: #bla) equals: #blo
]

{ #category : 'tests' }
IceGitPropertiesFileTest >> testRecoverPropertiesFromOldCommitEvenIfDiskIsDifferent [
	self repository properties
		at: #bla put: #old.
	
	self repository commitWithMessage: 'add properties'.
	
	"Write to disk without commit"
	self repository properties
		at: #bla put: #blo.
	
	self assert: (self repository properties at: #bla) equals: #blo.
	self assert: (self repository head properties at: #bla) equals: #old
]

{ #category : 'tests' }
IceGitPropertiesFileTest >> testRecoverPropertiesFromOldCommitEvenIfHeadIsDifferent [
	self repository properties
		at: #bla put: #old.
	self repository commitWithMessage: 'add properties'.
	
	self repository properties
		at: #bla put: #headBla.
	self repository commitWithMessage: 'change properties'.
	
	self repository properties
		at: #bla put: #inMemory.
	
	self assert: (self repository properties at: #bla) equals: #inMemory.
	self assert: (self repository head properties at: #bla) equals: #headBla.
	self assert: (self repository head commit parent properties at: #bla) equals: #old.
]
