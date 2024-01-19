"
Description
--------------------

I a browser centered on a Pull Request. 

I display the list of commits of the PR for review, allow the user to merge the PR and to accept/reject it of the user has the rights on the repository.

"
Class {
	#name : 'IceGitHubTipPullRequestBrowser',
	#superclass : 'IceTipBrowser',
	#instVars : [
		'repositoryModel',
		'pullRequest',
		'commitLabel',
		'commits',
		'diff',
		'mergeButton',
		'acceptButton',
		'rejectButton'
	],
	#category : 'Iceberg-Plugin-GitHub-View',
	#package : 'Iceberg-Plugin-GitHub',
	#tag : 'View'
}

{ #category : 'commands' }
IceGitHubTipPullRequestBrowser class >> buildGeneralCommandGroupWith: presenter for: aCommandGroup [

	"Nothing to add"
]

{ #category : 'commands' }
IceGitHubTipPullRequestBrowser class >> buildSelectionCommandGroupWith: presenter for: aCommandGroup [

	"Nothing to add"
]

{ #category : 'instance creation' }
IceGitHubTipPullRequestBrowser class >> newApplication: app model: aModel pullRequest: aPullRequest [

	^ self basicNew
		application: app;
		pullRequest: aPullRequest;
		setModelBeforeInitialization: aModel;
		initialize;
		yourself
]

{ #category : 'accessing' }
IceGitHubTipPullRequestBrowser class >> taskbarIconName [

	^ #komitterSmalltalkhubRemote
]

{ #category : 'accessing - ui' }
IceGitHubTipPullRequestBrowser >> acceptButton [

	^ acceptButton
]

{ #category : 'actions' }
IceGitHubTipPullRequestBrowser >> acceptPullRequest [

	IceGitHubAcceptPullRequestModel new
		onAccept: [ :aModel | 
			IceGitHubAPI ensureCredentials.
			self pullRequest acceptMessage: aModel message type: aModel type.
			self closeWindow ];
		open
]

{ #category : 'accessing - ui' }
IceGitHubTipPullRequestBrowser >> commitLabel [

	^ commitLabel
]

{ #category : 'accessing - ui' }
IceGitHubTipPullRequestBrowser >> commits [

	^ commits
]

{ #category : 'initialization' }
IceGitHubTipPullRequestBrowser >> connectPresenters [

	super connectPresenters.
	self commits whenSelectionChangedDo: [ :selection | 
		self diff selectedModel: selection selectedItem ].

	mergeButton action: [ self mergePullRequestIntoImage ].
	acceptButton action: [ self acceptPullRequest ].
	rejectButton action: [ self rejectPullRequest ]
]

{ #category : 'layout' }
IceGitHubTipPullRequestBrowser >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: commitLabel expand: false;
		add: (SpPanedLayout newTopToBottom
			add: commits;
			add: diff;
			yourself);
		add: (SpBoxLayout newLeftToRight
				spacing: 5;
				add: mergeButton expand: false;
				addLast: acceptButton expand: false;
				addLast: rejectButton expand: false;
				yourself)
  				expand: false;
  			yourself
]

{ #category : 'accessing - ui' }
IceGitHubTipPullRequestBrowser >> diff [

	^ diff
]

{ #category : 'initialization' }
IceGitHubTipPullRequestBrowser >> initialExtentForWindow [

	^ (1050 @ 800) scaledByDisplayScaleFactor
]

{ #category : 'initialization' }
IceGitHubTipPullRequestBrowser >> initializeCommitsTable [

	| textStylingBlock |
	textStylingBlock := [ :string :commit | 
	                    commit isMerged
		                    ifTrue: [ string asText ]
		                    ifFalse: [ string asText allBold ] ].

	commits
		beResizable;
		addColumn: (SpStringTableColumn new
				 title: 'Date & time';
				 evaluated: [ :commit | 
					 textStylingBlock
						 value: commit datetime asLocalStringYMDHM
						 value: commit ];
				 width: 120 * self currentWorld displayScaleFactor;
				 yourself);
		addColumn: (SpStringTableColumn new
				 title: 'Id';
				 evaluated: [ :commit | 
					 textStylingBlock value: commit shortId value: commit ];
				 width: 50 * self currentWorld displayScaleFactor;
				 yourself);
		addColumn: (SpStringTableColumn new
				 title: 'Author';
				 evaluated: [ :commit | 
					 textStylingBlock value: commit author value: commit ];
				 width: 120 * self currentWorld displayScaleFactor;
				 yourself);
		addColumn: (SpStringTableColumn new
				 title: 'Comment';
				 evaluated: [ :commit | 
					 textStylingBlock value: commit comment value: commit ];
				 width: 300 * self currentWorld displayScaleFactor;
				 yourself).
		
	
]

{ #category : 'initialization' }
IceGitHubTipPullRequestBrowser >> initializeDiff [

	diff beForMerge.

]

{ #category : 'initialization' }
IceGitHubTipPullRequestBrowser >> initializePresenters [

	super initializePresenters.

	commitLabel := self newLabel.
	commits := self newTable.
	diff := self instantiate: IceTipCommitInfoPresenter.
	mergeButton := self newButton.
	acceptButton := self newButton.
	rejectButton := self newButton.
	
	commitLabel label: 'Commits'.
	self initializeCommitsTable.
	diff beForMerge.
	mergeButton 
		addStyle: 'large';
		label: 'Merge into image'; 
		icon: (self iconNamed: #smallLoadProject).
	acceptButton 
		addStyle: 'large';
		label: 'Accept pull request'; 
		icon: (self iconNamed: #testGreen).
	rejectButton 
		addStyle: 'large';
		label: 'Reject pull request'; 
		icon: (self iconNamed: #testRed)
]

{ #category : 'accessing - ui' }
IceGitHubTipPullRequestBrowser >> mainList [
	"Answer the presenter that is the main list of items of this browser."

	^ commits
]

{ #category : 'accessing - ui' }
IceGitHubTipPullRequestBrowser >> mergeButton [

	^ mergeButton
]

{ #category : 'actions' }
IceGitHubTipPullRequestBrowser >> mergePullRequestIntoImage [

	(self confirm:
		 ('I will create a new local branch named {1}. Should I continue?'
			  format: { self pullRequest branchName })) ifFalse: [ ^ self ].

	IceGitHubAPI ensureCredentials.

	self pullRequest mergeIntoWorkingCopy
]

{ #category : 'accessing' }
IceGitHubTipPullRequestBrowser >> pullRequest [
	^ pullRequest
]

{ #category : 'accessing' }
IceGitHubTipPullRequestBrowser >> pullRequest: anObject [
	pullRequest := anObject
]

{ #category : 'initialization' }
IceGitHubTipPullRequestBrowser >> refresh [

	| commitModels |
	commitModels := self pullRequest commits collect: [ :each |
		                IceTipCommitModel
			                repositoryModel: self repositoryModel
			                on: each ].

	commits items: commitModels
]

{ #category : 'accessing - ui' }
IceGitHubTipPullRequestBrowser >> rejectButton [

	^ rejectButton
]

{ #category : 'actions' }
IceGitHubTipPullRequestBrowser >> rejectPullRequest [

	((IceGitHubRejectPullRequestModel newApplication: self application)
		onAccept: [ :aModel | 
			IceGitHubAPI ensureCredentials.
			self pullRequest rejectMessage: aModel message.
			self closeWindow ];
		asModalWindow)
			centeredRelativeTo: self window;
			open
]

{ #category : 'accessing' }
IceGitHubTipPullRequestBrowser >> repositoryModel [
	^ repositoryModel
]

{ #category : 'accessing' }
IceGitHubTipPullRequestBrowser >> repositoryModel: anObject [
	repositoryModel := anObject
]

{ #category : 'initialization' }
IceGitHubTipPullRequestBrowser >> setModelBeforeInitialization: aModel [

	self repositoryModel: aModel
]

{ #category : 'accessing' }
IceGitHubTipPullRequestBrowser >> titleForWindow [

	^ 'Browsing pull request: #{1} {2}' format: { self pullRequest number. self pullRequest title }

]

{ #category : 'initialization' }
IceGitHubTipPullRequestBrowser >> updatePresenter [

	self refresh
]
