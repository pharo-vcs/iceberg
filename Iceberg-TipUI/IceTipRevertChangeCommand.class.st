"
I'm a command to install a chunk of code from a commit (shown in a diff) into the image. 
""chunk"" can be a package, class or single method.
"
Class {
	#name : 'IceTipRevertChangeCommand',
	#superclass : 'IceTipCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipRevertChangeCommand class >> defaultDescription [

	^ 'Revert selected change in the image'
]

{ #category : 'accessing - defaults' }
IceTipRevertChangeCommand class >> defaultName [

	^ 'Revert change'
]

{ #category : 'executing' }
IceTipRevertChangeCommand >> execute [

	context application
		informUser: 'Reverting change...'
		during: [ self repository workingCopy discardChanges: self item ].

	self toolAnnouncer announce:
		(IceTipDiffEntryRemoved entry: self item).
	Iceberg announcer announce:
		(IceRepositoryModified for: self repository)
]

{ #category : 'accessing' }
IceTipRevertChangeCommand >> iconName [

	^ #smallUndo
]

{ #category : 'executing' }
IceTipRevertChangeCommand >> tool [
	"We consider the diffPanel of the context as our tool. This is important because we have to announce in the same Announcer instance that is subscribed for our news."

	^ super tool diffPanel
]
