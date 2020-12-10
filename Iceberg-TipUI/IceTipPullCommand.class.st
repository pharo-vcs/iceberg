"
I'm a command to perform a pull of incomming commits. 
I open a pull view window.
"
Class {
	#name : #IceTipPullCommand,
	#superclass : #IceTipRemoteActionCommand2,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipPullCommand class >> defaultDescription [

	^ 'Pulls into image all commits from your version to the origin remote HEAD'
]

{ #category : #accessing }
IceTipPullCommand class >> defaultName [

	^ 'Pull'
]

{ #category : #execution }
IceTipPullCommand >> badge [

	| result |
	(self repositoryModel isNotNil and: [
		self repositoryModel isMissing not]) ifTrue: [
		result := self repositoryModel numberOfIncomingCommits.
		"If zero, reset to nil to make it dissapear in Spec."
		result isZero ifTrue: [ result := nil ] ].

	^ result
]

{ #category : #execution }
IceTipPullCommand >> execute [

	self withErrorHandlingDo: [ 
		self validateRemotesPresent.
	 	(IceTipPullBrowser onRepositoryModel: self repositoryModel) openWithSpec ]

]

{ #category : #accessing }
IceTipPullCommand >> iconName [

	^ #down
]
