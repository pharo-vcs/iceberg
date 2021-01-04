"
I'm a the abstract superclass of commands that act on repositories.
"
Class {
	#name : #IceTipRepositoryCommand2,
	#superclass : #IceTipCommand,
	#instVars : [
		'announcer'
	],
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipRepositoryCommand2 class >> isAbstract [

	^ self == IceTipRepositoryCommand2
]

{ #category : #testing }
IceTipRepositoryCommand2 >> actsOnBranch: aBranchModel [

	^ false
]

{ #category : #testing }
IceTipRepositoryCommand2 >> actsOnRemote: aRemoteModel [

	^ false
]

{ #category : #testing }
IceTipRepositoryCommand2 >> actsOnTag: aTagModel [

	^ false
]

{ #category : #accessing }
IceTipRepositoryCommand2 >> announcer [

	^ self context toolAnnouncer
]
