Class {
	#name : #IceTipResetBranchToThisCommitCommand,
	#superclass : #IceTipCommand,
	#instVars : [
		'selectedCommitish',
		'selectedBranch'
	],
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #activation }
IceTipResetBranchToThisCommitCommand class >> browserHistoryContextActivation [
	<classAnnotation>
	
	^ CmdContextMenuActivation
		byRootGroupItemOrder: 10
		for: IceTipHistoryContext
]

{ #category : #accessing }
IceTipResetBranchToThisCommitCommand class >> defaultHelp [
	^ 'Resets the selected branch to the selected commit. It does not modify the working copy (!!).'
]

{ #category : #activation }
IceTipResetBranchToThisCommitCommand class >> defaultMenuIconName [
	^ #bottom
]

{ #category : #execution }
IceTipResetBranchToThisCommitCommand >> defaultMenuItemName [

	^ 'Reset ', selectedBranch name, ' to commit ', selectedCommitish shortId
]

{ #category : #execution }
IceTipResetBranchToThisCommitCommand >> execute [
	
	selectedBranch resetToCommit: selectedCommitish.
	Iceberg announcer announce: (IceRepositoryModified for: self repositoryModel entity).
]

{ #category : #execution }
IceTipResetBranchToThisCommitCommand >> readParametersFromContext: aToolContext [
	super readParametersFromContext: aToolContext.
	selectedCommitish := aToolContext item.
	selectedBranch := aToolContext selectedBranch.
]
