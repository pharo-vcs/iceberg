"
I'm a command to perform a merge  of current image sources with head commit.
"
Class {
	#name : 'IceMergeWorkingCopyCommand',
	#superclass : 'IceRepositoryCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'execute' }
IceMergeWorkingCopyCommand >> execute [
	| commit |
	commit := self repository headCommit.
	commit newMergeAction executeWithContext: context.
	(self repository workingCopy referenceCommit = commit)
		ifTrue: [ self beSuccess ]
]
