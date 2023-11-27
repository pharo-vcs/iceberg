"
I'm a spec model to present a detailed view of a Pull Request.
"
Class {
	#name : 'IceGitHubPullRequestDetailModel',
	#superclass : 'SpPresenter',
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
		'statusIcon',
		'scheduler'
	],
	#category : 'Iceberg-Plugin-GitHub-View',
	#package : 'Iceberg-Plugin-GitHub',
	#tag : 'View'
}

{ #category : 'commands' }
IceGitHubPullRequestDetailModel class >> buildCommandsGroupWith: presenterIntance forRoot: rootCommandGroup [

	rootCommandGroup register:
		((CmCommandGroup named: 'checks commands') asSpecGroup 
			register: (IceTipOpenCheckUrlCommand forSpecContext: presenterIntance))
]

{ #category : 'accessing - ui' }
IceGitHubPullRequestDetailModel >> authorLabel [
	^ authorLabel
]

{ #category : 'accessing - ui' }
IceGitHubPullRequestDetailModel >> authorText [
	^ authorText
]

{ #category : 'accessing - ui' }
IceGitHubPullRequestDetailModel >> bodyText [
	^ bodyText
]

{ #category : 'accessing - ui' }
IceGitHubPullRequestDetailModel >> checksTable [
	^ checksTable
]

{ #category : 'layout' }
IceGitHubPullRequestDetailModel >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		borderWidth: 5;
		spacing: 5;
		add: (SpGridLayout new 
			borderWidth: 0;
			beColumnNotHomogeneous;
			column: 2 expand: true;
			build: [ :builder | builder
				add: urlLabel; add: urlText; nextRow; 
				add: authorLabel; add: authorText; nextRow;
				add: fromLabel; add: fromText; nextRow;
				add: toLabel; add: toText; nextRow; 
				add: mergeableLabel; add: (SpBoxLayout newLeftToRight
						spacing: 5;
						add: mergeableIcon expand: false;
						add: mergeableMessage; 
						yourself);
					nextRow;
				add: statusLabel; add: (SpBoxLayout newLeftToRight
						spacing: 5;
						add: statusIcon expand: false;
						add: statusMessage;
						yourself);
					nextRow ];
				yourself);
		add: checksTable expand: false;
		add: bodyText expand: false;
		yourself
]

{ #category : 'accessing - ui' }
IceGitHubPullRequestDetailModel >> fromLabel [
	^ fromLabel
]

{ #category : 'accessing - ui' }
IceGitHubPullRequestDetailModel >> fromText [
	^ fromText
]

{ #category : 'private' }
IceGitHubPullRequestDetailModel >> iconForMergeable: mergeable [
	mergeable = true ifTrue: [ ^ self iconNamed: #smallOk ].
	^ self iconNamed: #smallCancel
]

{ #category : 'private' }
IceGitHubPullRequestDetailModel >> iconForStatus: status [
	status = 'success' ifTrue: [ ^ self iconNamed: #testGreen ].
	status = 'failure' ifTrue: [ ^ self iconNamed: #testRed ].
	status = 'pending' ifTrue: [ ^ self iconNamed: #testYellow ].
	
	^ self iconNamed: #testNotRun
]

{ #category : 'initialization' }
IceGitHubPullRequestDetailModel >> initializePresenters [

	urlLabel := self newLabel label: 'Url'.
	authorLabel := self newLabel label: 'Author'.
	fromLabel := self newLabel label: 'From'.
	toLabel := self newLabel label: 'Into'.
	mergeableLabel := self newLabel label: 'Mergeable'.
	statusLabel := self newLabel label: 'Status'.

	urlText := self newTextInput editable: false; addStyle: 'iceTipReadonly'; yourself.
	authorText  := self newTextInput editable: false; addStyle: 'iceTipReadonly'; yourself.
	fromText  := self newTextInput editable: false; addStyle: 'iceTipReadonly'; yourself.
	toText  := self newTextInput editable: false; addStyle: 'iceTipReadonly'; yourself.
	mergeableIcon := self newImage.
	mergeableMessage := self newTextInput editable: false; addStyle: 'iceTipReadonly'; yourself.
	statusIcon  := self newImage.
	statusMessage := self newTextInput editable: false; addStyle: 'iceTipReadonly'; yourself.
	checksTable := self newChecksTable.
	checksTable addStyle: 'rows4'.
	bodyText := self newText editable: false; yourself.
	bodyText 
		addStyle: 'lines8';
		addStyle: 'iceTipReadonly'
]

{ #category : 'accessing - ui' }
IceGitHubPullRequestDetailModel >> mergeableLabel [
	^ mergeableLabel
]

{ #category : 'accessing - ui' }
IceGitHubPullRequestDetailModel >> mergeableMessage [
	^ mergeableMessage
]

{ #category : 'private - factory' }
IceGitHubPullRequestDetailModel >> newChecksTable [

	^ self newTable
		addColumn: (SpCompositeTableColumn new
			title: 'state';
			addColumn: (SpImageTableColumn new 
				evaluated: [ :aStatus | self iconForStatus: (aStatus at: 'state') ];
				beNotExpandable);
			addColumn: (SpStringTableColumn evaluated: [ :aStatus | aStatus at: 'state' ]);
			width: 120;
			yourself);
		addColumn: (SpStringTableColumn new
			title: 'context';
			evaluated: [ :aStatus | aStatus at: 'context' ];
			yourself);
		addColumn: (SpStringTableColumn new
			title: 'description';
			evaluated: [ :aStatus | aStatus at: 'description' ];
			yourself);
		beResizable;
		contextMenu: [ (self rootCommandsGroup / 'checks commands') beRoot asMenuPresenter ]
]

{ #category : 'accessing' }
IceGitHubPullRequestDetailModel >> pullRequest [
	^ pullRequest
]

{ #category : 'accessing' }
IceGitHubPullRequestDetailModel >> pullRequest: aPullRequest [
	
	pullRequest := aPullRequest.
	self updatePresenter
]

{ #category : 'private' }
IceGitHubPullRequestDetailModel >> retrieveDetail [
	
	self mergeableMessage text: (self mergeableMessage text , '  Loading...' ).
	self schedule: [ 
		| detail mergeable |  
		[  
			detail := self pullRequest detail.
			mergeable := detail at: #mergeable ]
		on: Error do: [ :e | 
			mergeable := nil ].
		mergeableMessage defer: [
			mergeableMessage text: (self textForMergeable: mergeable) ].
		mergeableIcon defer: [
			mergeableIcon image: ( self iconForMergeable: mergeable) ] ]
]

{ #category : 'private' }
IceGitHubPullRequestDetailModel >> retrieveStatuses [
"	self statusPanel widget addMorphBack: 'Loading...' asMorph."
	self statusMessage text: (statusMessage text , '  Loading...').
	self schedule: [ 
		| status generalStatus statuses |	
		[
			status := self pullRequest status.
			generalStatus := status at: 'state'.
			statuses := status at: 'statuses' ]
		on: Error do: [ :e | 
			generalStatus := 'Unknown'.
			statuses := #() ].
			statusMessage defer: [
				statusMessage text: (self textForMergeable: generalStatus) ].
			statusIcon defer: [
				statusIcon image: (self iconForStatus: generalStatus) ].
			checksTable defer: [ checksTable items:(statuses ) ] ]
]

{ #category : 'private' }
IceGitHubPullRequestDetailModel >> schedule: aBlock [

	self scheduler schedule: aBlock
]

{ #category : 'private' }
IceGitHubPullRequestDetailModel >> scheduler [

	^ scheduler ifNil: [ 
			scheduler := TKTWorkerPool new
				poolMaxSize: 2;
				start;
				yourself ]
]

{ #category : 'accessing - ui' }
IceGitHubPullRequestDetailModel >> statusIcon [
	^ statusIcon
]

{ #category : 'accessing - ui' }
IceGitHubPullRequestDetailModel >> statusLabel [
	^ statusLabel
]

{ #category : 'accessing - ui' }
IceGitHubPullRequestDetailModel >> statusMessage [
	^ statusMessage
]

{ #category : 'private' }
IceGitHubPullRequestDetailModel >> textForMergeable: mergeable [

	mergeable = true ifTrue: [ ^ 'Yes' ].
	mergeable = false ifTrue: [ ^ 'There are conflicts' ].
	^ mergeable 
		ifNotNil: [ mergeable asString ]  
		ifNil: [ 'Unknown' ]
]

{ #category : 'accessing - ui' }
IceGitHubPullRequestDetailModel >> toLabel [
	^ toLabel
]

{ #category : 'accessing - ui' }
IceGitHubPullRequestDetailModel >> toText [
	^ toText
]

{ #category : 'initialization' }
IceGitHubPullRequestDetailModel >> updatePresenter [

	self pullRequest ifNil: [ ^ self ].
	
	urlText text: self pullRequest url.
	authorText text: self pullRequest author.
	fromText text: self pullRequest headLabel.
	toText text: self pullRequest baseLabel.
	bodyText text: (self pullRequest body ifNil: [ '' ]).
	self retrieveStatuses.
	self retrieveDetail
]

{ #category : 'accessing - ui' }
IceGitHubPullRequestDetailModel >> urlLabel [
	^ urlLabel
]

{ #category : 'accessing - ui' }
IceGitHubPullRequestDetailModel >> urlText [
	^ urlText
]
