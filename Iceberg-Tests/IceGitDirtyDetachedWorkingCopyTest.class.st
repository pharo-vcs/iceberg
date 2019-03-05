Class {
	#name : #IceGitDirtyDetachedWorkingCopyTest,
	#superclass : #IceDirtyDetachedWorkingCopyTest,
	#category : 'Iceberg-Tests-Git'
}

{ #category : #running }
IceGitDirtyDetachedWorkingCopyTest >> newFixture [

	^ IceDirtyDetachedWorkingCopyFixture inGit
]
