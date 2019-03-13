Class {
	#name : #IceSinglePackageLocalGitRepositoryWithSubdirectoryTest,
	#superclass : #IceSinglePackageLocalRepositoryTest,
	#category : 'Iceberg-Tests-Git'
}

{ #category : #running }
IceSinglePackageLocalGitRepositoryWithSubdirectoryTest >> newFixture [

	^ IceSinglePackageFixture inGit
		subdirectory: 'src';
		yourself
]
