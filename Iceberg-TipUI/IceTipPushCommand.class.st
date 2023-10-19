"
I'm a command to perform a push of outgoing commits. 
I open a push view window.
"
Class {
	#name : 'IceTipPushCommand',
	#superclass : 'IceTipRemoteActionCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipPushCommand class >> defaultDescription [

	^ 'Pushes pending commits to the origin repository (in current branch)'
]

{ #category : 'accessing - defaults' }
IceTipPushCommand class >> defaultName [

	^ 'Push'
]

{ #category : 'executing' }
IceTipPushCommand >> badge [

	| result |
	(self repositoryModel isNotNil and: [
		self repositoryModel isMissing not]) ifTrue: [
		result := self repositoryModel numberOfOutgoingCommits.
		"If zero, reset to nil to make it dissapear in Spec."
		result = '0' ifTrue: [ result := nil ] ].

	^ result

]

{ #category : 'executing' }
IceTipPushCommand >> execute [

	self withErrorHandlingDo: [ 
		self validateRemotesPresent.
		(IceTipPushBrowser onRepositoryModel: self repositoryModel) open ]
]

{ #category : 'accessing' }
IceTipPushCommand >> iconName [

	^ #up
]
