Class {
	#name : 'IceGitCleanWorkingCopyTest',
	#superclass : 'IceCleanWorkingCopyTest',
	#category : 'Iceberg-Tests-Git',
	#package : 'Iceberg-Tests',
	#tag : 'Git'
}

{ #category : 'running' }
IceGitCleanWorkingCopyTest >> newFixture [
	^ IceCleanWorkingCopyFixture inGit
]
