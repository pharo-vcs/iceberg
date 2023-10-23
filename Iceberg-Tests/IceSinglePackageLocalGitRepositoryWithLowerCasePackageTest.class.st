Class {
	#name : 'IceSinglePackageLocalGitRepositoryWithLowerCasePackageTest',
	#superclass : 'IceSinglePackageLocalRepositoryTest',
	#category : 'Iceberg-Tests-Git',
	#package : 'Iceberg-Tests',
	#tag : 'Git'
}

{ #category : 'running' }
IceSinglePackageLocalGitRepositoryWithLowerCasePackageTest >> newFixture [

	^ IceSinglePackageFixture inGit
		packageName1: 'lowercasepackage';
		yourself
]
