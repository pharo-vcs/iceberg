Class {
	#name : #IceSinglePackageLocalGitRepositoryWithDotSubdirectoryTest,
	#superclass : #IceSinglePackageLocalRepositoryTest,
	#category : 'Iceberg-Tests-Git'
}

{ #category : #running }
IceSinglePackageLocalGitRepositoryWithDotSubdirectoryTest >> newFixture [
	^ IceSinglePackageFixture inGit
		subdirectory: '.';
		yourself
]

{ #category : #running }
IceSinglePackageLocalGitRepositoryWithDotSubdirectoryTest >> testCodeSubdirectoryIsRoot [

	self assert: self repository location equals: self repository subdirectoryReference
]
