Class {
	#name : #IceTipAdoptCommitCommand,
	#superclass : #IceTipRepositoryCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipAdoptCommitCommand class >> defaultDescription [

	^ 'Sets this commit as the commit of your working copy. It will not modify your loaded code, but it will calculate the differences between your loaded packages and the the new commit to mark packages as dirty.'
]

{ #category : #accessing }
IceTipAdoptCommitCommand >> defaultNameFromContext [

	^ 'Adopt commit ' , self selectedCommitish shortId
]

{ #category : #execution }
IceTipAdoptCommitCommand >> execute [
	
	self selectedCommitish adopt.
	Iceberg announcer announce: (IceRepositoryModified for: self repository)
]

{ #category : #accessing }
IceTipAdoptCommitCommand >> iconName [

	^ #recoverLostChanges
]

{ #category : #initialization }
IceTipAdoptCommitCommand >> name [
	"Answer the name for the command. In order to have a specialized string for certain parameters of the context, and given the fact that sometimes the context is nil (e.g. when a context menu is calculated when the selection is empty)."

	self flag: #pharoTodo. "Find another solution (problem explained above)"
	^ self context
		  ifNil: [ self className ]
		  ifNotNil: [ self defaultNameFromContext ]
]

{ #category : #accessing }
IceTipAdoptCommitCommand >> selectedCommitish [

	^ self item
]
