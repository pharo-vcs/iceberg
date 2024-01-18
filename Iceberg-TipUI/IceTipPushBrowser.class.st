"
I perform a push of outgoing commits.

"
Class {
	#name : 'IceTipPushBrowser',
	#superclass : 'IceTipRemoteActionBrowser',
	#category : 'Iceberg-TipUI-View-Repository',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Repository'
}

{ #category : 'commands' }
IceTipPushBrowser class >> buildGeneralCommandGroupWith: presenter for: aCommandGroup [

	"No commands to add."
]

{ #category : 'instance creation' }
IceTipPushBrowser class >> onRepositoryModel: aModel [

	^ self on:
		  (IceTipPushModel repositoryModel: aModel on: aModel entity)
]

{ #category : 'actions' }
IceTipPushBrowser >> doPush [

	self model newPushAction executeWithContext: self.
	self closeWindow
]

{ #category : 'initialization' }
IceTipPushBrowser >> labelForRemotePanel [

	^ 'Push to remote'

]

{ #category : 'private - factory' }
IceTipPushBrowser >> newActionButton [

	^ self newButton
		label: 'Push';
		icon: (self iconNamed: #up);
		help: ('Push new commits to {1}' format: { self model remoteName });
		action: [ self doPush ];
		yourself

]

{ #category : 'initialization' }
IceTipPushBrowser >> titleForWindow [

	^ 'Push {1}/{2} to {3}' format: { 
		self model repositoryName.
		self model branchName. 
		self model remoteName }
]
