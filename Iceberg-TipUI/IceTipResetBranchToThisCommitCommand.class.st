"
I'm a command to reset the selected branch to the selected commit. It does not modify the working copy.
"
Class {
	#name : 'IceTipResetBranchToThisCommitCommand',
	#superclass : 'IceTipRepositoryCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipResetBranchToThisCommitCommand class >> defaultDescription [

	^ 'Resets the selected branch to the selected commit. It does not modify the working copy (!!).'
]

{ #category : 'testing' }
IceTipResetBranchToThisCommitCommand >> canBeExecuted [

	^ self selectedBranch isNotNil
]

{ #category : 'executing' }
IceTipResetBranchToThisCommitCommand >> defaultNameFromContext [

	| shortId branchName |
	shortId := self selectedCommitish ifNotNil: [ :commitish | commitish shortId ] ifNil: [''].
	branchName := self selectedBranch ifNotNil: [:branch | branch name ] ifNil: [ '' ].

	^ 'Reset ', branchName, ' to commit ', shortId
]

{ #category : 'executing' }
IceTipResetBranchToThisCommitCommand >> execute [
	
	self selectedBranch resetToCommit: self selectedCommitish.
	Iceberg announcer announce: (IceRepositoryModified for: self repository).
]

{ #category : 'accessing' }
IceTipResetBranchToThisCommitCommand >> iconName [

	^ #bottom
]

{ #category : 'initialization' }
IceTipResetBranchToThisCommitCommand >> name [

	^ self context
		  ifNil: [ self className ]
		  ifNotNil: [ self defaultNameFromContext ]
]

{ #category : 'accessing' }
IceTipResetBranchToThisCommitCommand >> selectedBranch [

	| selected |
	selected := self context model.
	^ (selected isNotNil and: [ selected isBranch ]) ifTrue: [ selected ]
]

{ #category : 'accessing' }
IceTipResetBranchToThisCommitCommand >> selectedCommitish [

	^ self item
]
