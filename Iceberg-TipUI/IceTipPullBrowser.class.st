"
I perform a pull of incoming commits.

"
Class {
	#name : #IceTipPullBrowser,
	#superclass : #IceTipRemoteActionBrowser,
	#category : #'Iceberg-TipUI-View'
}

{ #category : #commands }
IceTipPullBrowser class >> buildGeneralCommandGroupWith: presenter for: aCommandGroup [

	aCommandGroup register: IceTipFetchCommand forSpec
]

{ #category : #'instance creation' }
IceTipPullBrowser class >> onRepositoryModel: aModel [

	^ self on: (IceTipPullModel 
		repositoryModel: aModel 
		on: aModel entity) 
		beCached

]

{ #category : #actions }
IceTipPullBrowser >> doPull [

	self model pullThen: [ self closeWindow ]
]

{ #category : #initialization }
IceTipPullBrowser >> labelForRemotePanel [

	^ 'Pull from remote:'
]

{ #category : #'private factory' }
IceTipPullBrowser >> newActionButton [

	^ self newButton
		label: 'Pull';
		icon: (self iconNamed: #down);
		help: ('Pull new commits from {1}' format: { self model remoteName });
		action: [ self doPull ];
		yourself

]

{ #category : #initialization }
IceTipPullBrowser >> titleForWindow [

	^ 'Pull {1}/{2} from {3}' format: { 
		self model repositoryName.
		self model branchName. 
		self model remoteName }

]
