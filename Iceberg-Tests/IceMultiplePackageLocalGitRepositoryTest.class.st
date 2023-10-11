Class {
	#name : 'IceMultiplePackageLocalGitRepositoryTest',
	#superclass : 'IceMultiplePackageRepositoryTest',
	#category : 'Iceberg-Tests-Git',
	#package : 'Iceberg-Tests',
	#tag : 'Git'
}

{ #category : 'running' }
IceMultiplePackageLocalGitRepositoryTest >> newFixture [
	^ IceMultiplePackageFixture inGit
]
