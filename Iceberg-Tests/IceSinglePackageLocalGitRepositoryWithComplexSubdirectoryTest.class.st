Class {
	#name : #IceSinglePackageLocalGitRepositoryWithComplexSubdirectoryTest,
	#superclass : #IceSinglePackageLocalRepositoryTest,
	#category : 'Iceberg-Tests-Git'
}

{ #category : #running }
IceSinglePackageLocalGitRepositoryWithComplexSubdirectoryTest >> newFixture [

	^ IceSinglePackageFixture inGit
		subdirectory: 'src/dev/somethingElse/complex-andWith-Dashes';
		yourself
]
