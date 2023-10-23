Class {
	#name : 'IceGitDirtyDetachedWorkingCopyTest',
	#superclass : 'IceDirtyDetachedWorkingCopyTest',
	#category : 'Iceberg-Tests-Git',
	#package : 'Iceberg-Tests',
	#tag : 'Git'
}

{ #category : 'running' }
IceGitDirtyDetachedWorkingCopyTest >> newFixture [

	^ IceDirtyDetachedWorkingCopyFixture inGit
]
