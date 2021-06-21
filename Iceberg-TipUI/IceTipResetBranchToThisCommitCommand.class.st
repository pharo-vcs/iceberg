"
I'm a command to reset the selected branch to the selected commit. It does not modify the working copy.
"
Class {
	#name : #IceTipResetBranchToThisCommitCommand,
	#superclass : #IceTipRepositoryCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #'accessing - defaults' }
IceTipResetBranchToThisCommitCommand class >> defaultDescription [

	^ 'Resets the selected branch to the selected commit. It does not modify the working copy (!!).'
]

{ #category : #executing }
IceTipResetBranchToThisCommitCommand >> defaultNameFromContext [

	^ 'Reset ', self selectedBranch name, ' to commit ', self selectedCommitish shortId
]

{ #category : #executing }
IceTipResetBranchToThisCommitCommand >> execute [
	
	self selectedBranch resetToCommit: self selectedCommitish.
	Iceberg announcer announce: (IceRepositoryModified for: self repository).
]

{ #category : #accessing }
IceTipResetBranchToThisCommitCommand >> iconName [

	^ #bottom
]

{ #category : #initialization }
IceTipResetBranchToThisCommitCommand >> name [

	^ self context
		  ifNil: [ self className ]
		  ifNotNil: [ self defaultNameFromContext ]
]

{ #category : #accessing }
IceTipResetBranchToThisCommitCommand >> selectedBranch [

	^ self context model
]

{ #category : #accessing }
IceTipResetBranchToThisCommitCommand >> selectedCommitish [

	^ self item
]
