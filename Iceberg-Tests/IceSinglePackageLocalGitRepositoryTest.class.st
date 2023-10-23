Class {
	#name : 'IceSinglePackageLocalGitRepositoryTest',
	#superclass : 'IceSinglePackageLocalRepositoryTest',
	#category : 'Iceberg-Tests-Git',
	#package : 'Iceberg-Tests',
	#tag : 'Git'
}

{ #category : 'running' }
IceSinglePackageLocalGitRepositoryTest >> newFixture [
	^ IceSinglePackageFixture inGit
]
