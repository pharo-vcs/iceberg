"
I'm a command to perform a pull of incomming commits. 
I open a pull view window.
"
Class {
	#name : 'IceTipPullCommand',
	#superclass : 'IceTipRemoteActionCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipPullCommand class >> defaultDescription [

	^ 'Pulls into image all commits from your version to the origin remote HEAD'
]

{ #category : 'accessing - defaults' }
IceTipPullCommand class >> defaultName [

	^ 'Pull'
]

{ #category : 'executing' }
IceTipPullCommand >> badge [

	| result |
	(self repositoryModel isNotNil and: [
		self repositoryModel isMissing not]) ifTrue: [
		result := self repositoryModel numberOfIncomingCommits.
		"If zero, reset to nil to make it dissapear in Spec."
		result isZero ifTrue: [ result := nil ] ].

	^ result
]

{ #category : 'executing' }
IceTipPullCommand >> execute [

	self withErrorHandlingDo: [ 
		self validateRemotesPresent.
	 	(IceTipPullBrowser onRepositoryModel: self repositoryModel) open ]

]

{ #category : 'accessing' }
IceTipPullCommand >> iconName [

	^ #down
]
