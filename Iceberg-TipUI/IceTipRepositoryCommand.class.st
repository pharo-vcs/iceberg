"
I'm a the abstract superclass of commands that act on repositories.
"
Class {
	#name : #IceTipRepositoryCommand,
	#superclass : #IceTipCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipRepositoryCommand class >> isAbstract [

	^ self == IceTipRepositoryCommand
]

{ #category : #testing }
IceTipRepositoryCommand >> actsOnBranch: aBranchModel [

	^ false
]

{ #category : #testing }
IceTipRepositoryCommand >> actsOnRemote: aRemoteModel [

	^ false
]

{ #category : #testing }
IceTipRepositoryCommand >> actsOnTag: aTagModel [

	^ false
]

{ #category : #accessing }
IceTipRepositoryCommand >> announcer [

	^ self context toolAnnouncer
]
