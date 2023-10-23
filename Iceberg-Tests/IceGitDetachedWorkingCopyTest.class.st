Class {
	#name : 'IceGitDetachedWorkingCopyTest',
	#superclass : 'IceDetachedWorkingCopyTest',
	#category : 'Iceberg-Tests-Git',
	#package : 'Iceberg-Tests',
	#tag : 'Git'
}

{ #category : 'running' }
IceGitDetachedWorkingCopyTest >> newFixture [

	^ IceDetachedWorkingCopyFixture inGit
]
