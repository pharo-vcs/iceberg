Class {
	#name : #IceSinglePackageLocalGitRepositoryTest,
	#superclass : #IceSinglePackageLocalRepositoryTest,
	#category : 'Iceberg-Tests-Git'
}

{ #category : #running }
IceSinglePackageLocalGitRepositoryTest >> newFixture [
	^ IceSinglePackageFixture inGit
]
