Class {
	#name : 'IceLibgitRepositoryTest',
	#superclass : 'TestCase',
	#category : 'Iceberg-Tests',
	#package : 'Iceberg-Tests'
}

{ #category : 'tests' }
IceLibgitRepositoryTest >> testLocalRepositoriesLocation [

	self assert: IceLibgitRepository localRepositoriesLocation exists
]

{ #category : 'tests' }
IceLibgitRepositoryTest >> testSharedRepositoriesLocation [

	self assert: IceLibgitRepository sharedRepositoriesLocation exists
]

{ #category : 'tests' }
IceLibgitRepositoryTest >> testDeleteRepositoryRemovesEmptyParentDirectory [
	| parentDir repoDir repository |
	parentDir := FileSystem memory / 'test-parent-dir'.
	parentDir ensureCreateDirectory.
	repoDir := parentDir / 'test-repo'.
	repoDir ensureCreateDirectory.

	repository := IceLibgitRepository on: repoDir.

	self assert: repoDir exists.
	self assert: parentDir exists.

	repository delete.

	self deny: repoDir exists.
	self deny: parentDir exists
]

{ #category : 'tests' }
IceLibgitRepositoryTest >> testDeleteRepositoryKeepsParentDirectoryWhenNotEmpty [
	| parentDir repoDir otherFile repository |
	parentDir := FileSystem memory / 'test-parent-dir'.
	parentDir ensureCreateDirectory.
	
	repoDir := parentDir / 'test-repo'.
	repoDir ensureCreateDirectory.
	
	"Create a sibling file in parentDir to make sure it's not empty"
	otherFile := parentDir / 'sibling.txt'.
	otherFile writeStreamDo: [ :stream | stream nextPutAll: 'keep me' ].

	repository := IceLibgitRepository on: repoDir.

	self assert: repoDir exists.
	self assert: parentDir exists.

	repository delete.

	self deny: repoDir exists.
	self assert: parentDir exists
]