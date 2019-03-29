Class {
	#name : #IceTipAdoptCommitCommand,
	#superclass : #IceTipCommand,
	#instVars : [
		'selectedCommitish',
		'selectedBranch'
	],
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #activation }
IceTipAdoptCommitCommand class >> browserHistoryContextActivation [
	<classAnnotation>
	
	^ CmdContextMenuActivation
		byRootGroupItemOrder: 10
		for: IceTipHistoryContext
]

{ #category : #accessing }
IceTipAdoptCommitCommand class >> defaultHelp [
	^ 'Sets this commit as the commit of your working copy. It will not modify your loaded code, but it will calculate the differences between your loaded packages and the the new commit to mark packages as dirty.'
]

{ #category : #activation }
IceTipAdoptCommitCommand class >> defaultMenuIconName [
	^ #recoverLostChanges
]

{ #category : #execution }
IceTipAdoptCommitCommand >> defaultMenuItemName [

	^ 'Adopt commit ', selectedCommitish shortId
]

{ #category : #execution }
IceTipAdoptCommitCommand >> execute [
	
	selectedCommitish adopt.
	Iceberg announcer announce: (IceRepositoryModified for: self repositoryModel entity)
]

{ #category : #execution }
IceTipAdoptCommitCommand >> readParametersFromContext: aToolContext [
	super readParametersFromContext: aToolContext.
	selectedCommitish := aToolContext item
]
