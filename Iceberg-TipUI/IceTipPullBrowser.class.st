"
I perform a pull of incoming commits.

"
Class {
	#name : #IceTipPullBrowser,
	#superclass : #IceTipRemoteActionBrowser,
	#category : #'Iceberg-TipUI-View'
}

{ #category : #specs }
IceTipPullBrowser class >> defaultSpec [
	<spec: #default>
	
	^ SpBoxLayout newVertical 
		add: #toolbar expand: false fill: true padding: 0;
		add: #remotePanel withConstraints: [ :c | c height: self inputTextHeight ];
		add: #commitsPanel withConstraints: [ :c | c spec: #panelSpec ];
		add: #actionButtonBar withConstraints: [ :c | c height: self buttonHeight ];
		yourself
]

{ #category : #'instance creation' }
IceTipPullBrowser class >> onRepositoryModel: aModel [
	^ self on: (IceTipPullModel 
		repositoryModel: aModel 
		on: aModel entity) 
		beCached
]

{ #category : #accessing }
IceTipPullBrowser >> contextClass [
	^ IceTipPullContext
]

{ #category : #actions }
IceTipPullBrowser >> doPull [
	self model pullThen: [ 
		self window delete ]
]

{ #category : #initialization }
IceTipPullBrowser >> initializeWidgets [
	super initializeWidgets.
	remotePanel label: 'Pull from remote:'.
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

{ #category : #accessing }
IceTipPullBrowser >> title [
	^ 'Pull {1}/{2} from {3}' format: { 
		self model repositoryName.
		self model branchName. 
		self model remoteName }
]
