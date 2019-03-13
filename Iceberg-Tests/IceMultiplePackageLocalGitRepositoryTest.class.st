Class {
	#name : #IceMultiplePackageLocalGitRepositoryTest,
	#superclass : #IceMultiplePackageRepositoryTest,
	#category : 'Iceberg-Tests-Git'
}

{ #category : #running }
IceMultiplePackageLocalGitRepositoryTest >> newFixture [
	^ IceMultiplePackageFixture inGit
]
