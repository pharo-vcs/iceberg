"
I'm a command to install a chunk of code from a commit (shown in a diff) into the image. 
""chunk"" can be a package, class or single method.
"
Class {
	#name : #IceTipRevertChangeCommand,
	#superclass : #IceTipCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipRevertChangeCommand class >> defaultDescription [

	^ 'Revert selected change in the image'
]

{ #category : #accessing }
IceTipRevertChangeCommand class >> defaultName [

	^ 'Revert change'
]

{ #category : #execution }
IceTipRevertChangeCommand >> execute [

	UIManager default
		informUser: 'Reverting change...'
		during: [
			self repository workingCopy discardChanges: self item ].

	self toolAnnouncer announce:
		(IceTipDiffEntryRemoved entry: self item).
	Iceberg announcer announce:
		(IceRepositoryModified for: self repository)
]

{ #category : #accessing }
IceTipRevertChangeCommand >> iconName [

	^ #smallUndo
]
