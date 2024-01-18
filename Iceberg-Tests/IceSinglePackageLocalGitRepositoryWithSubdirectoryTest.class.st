Class {
	#name : 'IceSinglePackageLocalGitRepositoryWithSubdirectoryTest',
	#superclass : 'IceSinglePackageLocalRepositoryTest',
	#category : 'Iceberg-Tests-Git',
	#package : 'Iceberg-Tests',
	#tag : 'Git'
}

{ #category : 'running' }
IceSinglePackageLocalGitRepositoryWithSubdirectoryTest >> newFixture [

	^ IceSinglePackageFixture inGit
		subdirectory: 'src';
		yourself
]
