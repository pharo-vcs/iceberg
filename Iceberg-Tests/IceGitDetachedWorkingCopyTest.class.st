Class {
	#name : #IceGitDetachedWorkingCopyTest,
	#superclass : #IceDetachedWorkingCopyTest,
	#category : 'Iceberg-Tests-Git'
}

{ #category : #running }
IceGitDetachedWorkingCopyTest >> newFixture [

	^ IceDetachedWorkingCopyFixture inGit
]
