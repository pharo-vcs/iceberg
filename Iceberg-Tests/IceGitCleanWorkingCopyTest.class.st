Class {
	#name : #IceGitCleanWorkingCopyTest,
	#superclass : #IceCleanWorkingCopyTest,
	#category : 'Iceberg-Tests-Git'
}

{ #category : #running }
IceGitCleanWorkingCopyTest >> newFixture [
	^ IceCleanWorkingCopyFixture inGit
]
