"
I'm a spec model to present a detailed view of a Pull Request.
"
Class {
	#name : #IceGitHubPullRequestDetailModel,
	#superclass : #SpPresenter,
	#instVars : [
		'urlLabel',
		'urlText',
		'authorLabel',
		'authorText',
		'fromLabel',
		'fromText',
		'toLabel',
		'toText',
		'mergeableLabel',
		'statusLabel',
		'checksTable',
		'bodyText',
		'pullRequest',
		'mergeableMessage',
		'mergeableIcon',
		'statusMessage',
		'statusIcon'
	],
	#category : #'Iceberg-Plugin-GitHub-View'
}

{ #category : #commands }
IceGitHubPullRequestDetailModel class >> buildCommandsGroupWith: presenterIntance forRoot: rootCommandGroup [

	rootCommandGroup register:
		((CmCommandGroup named: 'checks commands') asSpecGroup 
			register: IceTipOpenCheckUrlCommand forSpec)
]

{ #category : #specs }
IceGitHubPullRequestDetailModel class >> defaultSpec [
	<spec>
	^ SpBoxLayout newVertical
		add:
			(SpBoxLayout newHorizontal
				add: #urlLabel
					withConstraints:
						[ :constraints | constraints width: 80 * self currentWorld displayScaleFactor ];
				add: #urlText;
				yourself)
			height: self inputTextHeight;
		add:
			(SpBoxLayout newHorizontal
				add: #authorLabel
					withConstraints:
						[ :constraints | constraints width: 80 * self currentWorld displayScaleFactor ];
				add: #authorText;
				yourself)
			height: self inputTextHeight;
		add:
			(SpBoxLayout newHorizontal
				add: #fromLabel
					withConstraints:
						[ :constraints | constraints width: 80 * self currentWorld displayScaleFactor ];
				add: #fromText;
				yourself)
			height: self inputTextHeight;
		add:
			(SpBoxLayout newHorizontal
				add: #toLabel
					withConstraints:
						[ :constraints | constraints width: 80 * self currentWorld displayScaleFactor ];
				add: #toText;
				yourself)
			height: self inputTextHeight;
		add:
			(SpBoxLayout newHorizontal
				add: #mergeableLabel
					withConstraints:
						[ :constraints | constraints width: 80 * self currentWorld displayScaleFactor ];
				add: #mergeableIcon width: self iconWidth ;
				add: #mergeableMessage;
				yourself)
			height: self inputTextHeight;
		add:
			(SpBoxLayout newHorizontal
				add: #statusLabel
					withConstraints:
						[ :constraints | constraints width: 80 * self currentWorld displayScaleFactor ];
				add: #statusIcon width: self iconWidth ;
				add: #statusMessage;
				yourself)
			height: self inputTextHeight;
			add: #checksTable;
			add: #bodyText
			withConstraints:
				[ :constraints | constraints width: 80 * self currentWorld displayScaleFactor ];
		yourself
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel >> authorLabel [
	^ authorLabel
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel >> authorText [
	^ authorText
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel >> bodyText [
	^ bodyText
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel >> checksTable [
	^ checksTable
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel >> fromLabel [
	^ fromLabel
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel >> fromText [
	^ fromText
]

{ #category : #private }
IceGitHubPullRequestDetailModel >> iconForMergeable: mergeable [
	mergeable = true ifTrue: [ ^ self iconNamed: #smallOk ].
	^ self iconNamed: #smallCancel
]

{ #category : #private }
IceGitHubPullRequestDetailModel >> iconForStatus: status [
	status = 'success' ifTrue: [ ^ self iconNamed: #testGreen ].
	status = 'failure' ifTrue: [ ^ self iconNamed: #testRed ].
	status = 'pending' ifTrue: [ ^ self iconNamed: #testYellow ].
	
	^ self iconNamed: #testNotRun
]

{ #category : #initialization }
IceGitHubPullRequestDetailModel >> initializePresenters [

	urlLabel := self newLabel label: 'Url'.
	authorLabel := self newLabel label: 'Author'.
	fromLabel := self newLabel label: 'From'.
	toLabel := self newLabel label: 'Into'.
	mergeableLabel := self newLabel label: 'Mergeable'.
	statusLabel := self newLabel label: 'Status'.

	urlText := self newTextInput disable; yourself.
	authorText  := self newTextInput disable; yourself.
	fromText  := self newTextInput disable; yourself.
	toText  := self newTextInput disable; yourself.
	mergeableIcon := self newImage.
	mergeableMessage := self newTextInput disable; yourself.
	statusIcon  := self newImage.
	statusMessage := self newTextInput disable; yourself.
	checksTable := self newChecksTable.
	bodyText := self newText disable; yourself.

]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel >> mergeableLabel [
	^ mergeableLabel
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel >> mergeableMessage [
	^ mergeableMessage
]

{ #category : #'private factory' }
IceGitHubPullRequestDetailModel >> newChecksTable [
	^ self newTable
		addColumn:
			(SpCompositeTableColumn new
				title: 'state';
				addColumn:
					(SpImageTableColumn
						evaluated: [ :aStatus | self iconForStatus: (aStatus at: 'state') ]);
				addColumn: (SpStringTableColumn evaluated: [ :aStatus | aStatus at: 'state' ]);
				width: 50 * self currentWorld displayScaleFactor);
		addColumn:
			((SpStringTableColumn
				title: 'context';
				evaluated: [ :aStatus | aStatus at: 'context' ])
				width: 120 * self currentWorld displayScaleFactor);
		addColumn:
			(SpStringTableColumn
				title: 'description';
				evaluated: [ :aStatus | aStatus at: 'description' ]);
		beResizable;
		showColumnHeaders;
		contextMenu:
				[ (self rootCommandsGroup / 'checks commands') beRoot asMenuPresenter ]
]

{ #category : #accessing }
IceGitHubPullRequestDetailModel >> pullRequest [
	^ pullRequest
]

{ #category : #accessing }
IceGitHubPullRequestDetailModel >> pullRequest: aPullRequest [
	pullRequest := aPullRequest.
	urlText text: self pullRequest url.
	authorText text: self pullRequest author.
	fromText text: self pullRequest headLabel.
	toText text: self pullRequest baseLabel.
	bodyText text: self pullRequest body.
	self retrieveStatuses.
	self retrieveDetail
]

{ #category : #private }
IceGitHubPullRequestDetailModel >> retrieveDetail [
	
	self mergeableMessage text: (self mergeableMessage text , '  Loading...' ).
	[ | detail mergeable |  
		[  
			detail := self pullRequest detail.
			mergeable := detail at: #mergeable ]
		on: Error do: [ :e | mergeable := nil ].
		mergeableMessage defer: [mergeableMessage text: (self textForMergeable: mergeable).].
		mergeableIcon defer: [mergeableIcon image: ( self iconForMergeable: mergeable).].
		] fork
]

{ #category : #private }
IceGitHubPullRequestDetailModel >> retrieveStatuses [
"	self statusPanel widget addMorphBack: 'Loading...' asMorph."
	self statusMessage text: (statusMessage text , '  Loading...').
	[ | status generalStatus statuses |	
	[
		status := self pullRequest status.
		generalStatus := status at: 'state'.
		statuses := status at: 'statuses' ]
	on: Error do: [ :e | 
		generalStatus := 'Unknown'.
		statuses := #() ].
		statusMessage defer: [statusMessage text: (self textForMergeable: generalStatus).].
		statusIcon defer: [statusIcon image: (self iconForStatus: generalStatus).].
		checksTable defer: [ checksTable items:(statuses )]
	] fork
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel >> statusIcon [
	^ statusIcon
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel >> statusLabel [
	^ statusLabel
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel >> statusMessage [
	^ statusMessage
]

{ #category : #private }
IceGitHubPullRequestDetailModel >> textForMergeable: mergeable [
	mergeable = true ifTrue: [ ^ 'Yes' ].
	mergeable = false ifTrue: [ ^ 'There are conflicts' ].
	^ mergeable asString
	
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel >> toLabel [
	^ toLabel
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel >> toText [
	^ toText
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel >> urlLabel [
	^ urlLabel
]

{ #category : #'accessing ui' }
IceGitHubPullRequestDetailModel >> urlText [
	^ urlText
]
