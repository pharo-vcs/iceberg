"
I'm a command to perform a push of outgoing commits. 
I open a push view window.
"
Class {
	#name : #IceTipPushCommand,
	#superclass : #IceTipRemoteActionCommand2,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipPushCommand class >> defaultDescription [

	^ 'Pushes pending commits to the origin repository (in current branch)'
]

{ #category : #accessing }
IceTipPushCommand class >> defaultName [

	^ 'Push'
]

{ #category : #execution }
IceTipPushCommand >> badge [

	| result |
	(self repositoryModel isNotNil and: [
		self repositoryModel isMissing not]) ifTrue: [
		result := self repositoryModel numberOfOutgoingCommits.
		"If zero, reset to nil to make it dissapear in Spec."
		result = '0' ifTrue: [ result := nil ] ].

	^ result

]

{ #category : #execution }
IceTipPushCommand >> execute [

	self withErrorHandlingDo: [ 
		self validateRemotesPresent.
		(IceTipPushBrowser onRepositoryModel: self repositoryModel) openWithSpec ]
]

{ #category : #accessing }
IceTipPushCommand >> iconName [

	^ #up
]
