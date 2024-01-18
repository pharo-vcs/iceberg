"
I'm a the abstract superclass of commands that act on repositories. 
"
Class {
	#name : 'IceTipRemotesTreeCommand',
	#superclass : 'IceTipCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'testing' }
IceTipRemotesTreeCommand class >> isAbstract [

	^ self == IceTipRemotesTreeCommand
]

{ #category : 'testing' }
IceTipRemotesTreeCommand >> actsOnBranch: aBranchModel [

	^ false
]

{ #category : 'testing' }
IceTipRemotesTreeCommand >> actsOnRemote: aRemoteModel [

	^ false
]

{ #category : 'testing' }
IceTipRemotesTreeCommand >> actsOnTag: aTagModel [

	^ false
]

{ #category : 'testing' }
IceTipRemotesTreeCommand >> canBeExecuted [

	^ self hasSelectedItem and: [ self item canActivateCommand: self ]
]
