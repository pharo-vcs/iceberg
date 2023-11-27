"
I'm a panel to create a new branch taking a GitHub issue as basis.
A GitHub issue will be created in the form: 

123-a-github-issue
"
Class {
	#name : 'IceGitHubNewBranchFromIssuePanel',
	#superclass : 'IceTipCheckoutNewBranchPanel',
	#instVars : [
		'remotePanel',
		'issueNumberText',
		'issueLabel',
		'issue',
		'fetched',
		'selectRemoteModel',
		'currentWaitingProcess',
		'issueText',
		'remoteLabel'
	],
	#category : 'Iceberg-Plugin-GitHub-View',
	#package : 'Iceberg-Plugin-GitHub',
	#tag : 'View'
}

{ #category : 'accessing' }
IceGitHubNewBranchFromIssuePanel >> branchName [
	
	^ '{1}-{2}' format: { 
		issueNumberText text trim. 
		issueText text trim }.
]

{ #category : 'layout' }
IceGitHubNewBranchFromIssuePanel >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		borderWidth: 5;
		spacing: 5;
		add: currentBranchLabel expand: false;
		add: (SpGridLayout new 
			borderWidth: 0;
			beColumnNotHomogeneous;
			column: 2 expand: true;
			build: [ :builder | builder
				add: remoteLabel; add: remotePanel; nextRow;
				add: branchLabel; add: issueNumberText; nextRow;
				add: issueLabel; add: issueText; nextRow ];
			yourself);
		yourself
]

{ #category : 'accessing' }
IceGitHubNewBranchFromIssuePanel >> icon [

	^ (self iconNamed: #github) scaledToSize: 16@16
]

{ #category : 'initialization' }
IceGitHubNewBranchFromIssuePanel >> initialExtentForWindow [

	^ 800 @ 175
]

{ #category : 'initialization' }
IceGitHubNewBranchFromIssuePanel >> initialize [

	super initialize.
	fetched := false
]

{ #category : 'initialization' }
IceGitHubNewBranchFromIssuePanel >> initializePresenters [

	super initializePresenters.
	self initializeCurrentBranchLabel.
	remoteLabel := self newLabel
		label: 'Remote';
		yourself.
	remotePanel := self instantiate: IceTipSelectRemotePresenter on: self selectRemoteModel.
	remotePanel remoteList
		whenSelectedItemChangedDo: [ :remoteModel | self useRemote: remoteModel ].
	branchLabel := self newLabel
		label: 'Issue number';
		yourself.
	issueNumberText := self newTextInput
		placeholder: 'e.g., 123';
		autoAccept: true;
		yourself.
	issueLabel := self newLabel
		label: 'Branch name';
		yourself.
	issueText := self newTextInput
		placeholder: 'Generated-from-title-after-issue-number-is-completed';
		disable;
		yourself.
		
	issueNumberText whenTextChangedDo: [ :text | self validateIssue: text ]
]

{ #category : 'accessing - ui' }
IceGitHubNewBranchFromIssuePanel >> issueLabel [

	^ issueLabel
]

{ #category : 'accessing - ui' }
IceGitHubNewBranchFromIssuePanel >> issueNumberText [

	^ issueNumberText
]

{ #category : 'accessing - ui' }
IceGitHubNewBranchFromIssuePanel >> issueText [

	^ issueText
]

{ #category : 'accessing - ui' }
IceGitHubNewBranchFromIssuePanel >> remotePanel [

	^ remotePanel
]

{ #category : 'private' }
IceGitHubNewBranchFromIssuePanel >> sanitizeTitle: aString [
	| separators safeSeparator |
	
	aString isEmptyOrNil ifTrue: [ ^ self unknownTitle ].
	
	safeSeparator := $-.
	separators := { Character space. Character tab. $_. safeSeparator }.
	^ String streamContents: [ :str | 
		aString do: [ :c |
			(separators includes: c) ifTrue: [ str nextPut: safeSeparator ].
			c isAlphaNumeric ifTrue: [ str nextPut: c ] ] ]
]

{ #category : 'accessing' }
IceGitHubNewBranchFromIssuePanel >> selectRemoteModel [

	^ selectRemoteModel ifNil: [
		selectRemoteModel := IceTipRemoteActionModel 
			repositoryModel: self model
			on: self model entity ]
]

{ #category : 'initialization' }
IceGitHubNewBranchFromIssuePanel >> titleForWindow [

	^ 'New branch from issue'
]

{ #category : 'accessing' }
IceGitHubNewBranchFromIssuePanel >> unknownTitle [

	^ 'INVALID-ISSUE'
]

{ #category : 'private' }
IceGitHubNewBranchFromIssuePanel >> updateText: aString [ 

	issueText text: aString.
	fetched := true
]

{ #category : 'private' }
IceGitHubNewBranchFromIssuePanel >> useRemote: aRemoteModel [

	self selectRemoteModel useRemote: aRemoteModel
]

{ #category : 'accessing' }
IceGitHubNewBranchFromIssuePanel >> validate [
	
	self
		assert: ((issueNumberText text asString isNotEmpty) and: [ issueNumberText text isAllDigits ])
		description: 'Please enter a valid issue number'.
	self
		assert: fetched
		description: 'Please fetch a valid issue number'
]

{ #category : 'private' }
IceGitHubNewBranchFromIssuePanel >> validateIssue: aString [

	| number remote |
	fetched := false.
	aString trimmed isEmpty ifTrue: [ ^ self ].
	aString isAllDigits ifFalse: [ ^ self ].
	number := aString asNumber.
	(issue isNil or: [ (issue at: 'number') ~= number ]) ifFalse: [
		^ self ].
	remote := self selectRemoteModel remote.

	self wait: 500 milliSeconds thenDo: [
		[
		issue := IceGitHubAPI new
			         beAnonymous;
			         getIssue: remote owner
			         project: remote projectName
			         number: number.
		self defer: [
			self updateText: (self sanitizeTitle: (issue at: 'title')) ] ]
			on: IceGitHubError
			do: [ :e |
				e messageText = 'Not Found' ifFalse: [ e pass ].
				self defer: [
					self updateText: self unknownTitle ] ] ]
]

{ #category : 'private' }
IceGitHubNewBranchFromIssuePanel >> wait: time thenDo: aBlock [
	"This method avoids to request too many times the github api. 
	 It does it in the simplest way possible: it starts a process that waits some 
	 time (usually 500 milliseconds). If there is another entry before, it terminates 
	 the process and starts a new one."

	currentWaitingProcess ifNotNil: [ currentWaitingProcess terminate ].
	currentWaitingProcess := [ 
			time wait.
			aBlock value ] 
		forkNamed: 'GitHub issue tracker'
]
