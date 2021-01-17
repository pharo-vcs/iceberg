"
Description
--------------------

I am a spec presenter to show the list of PR available for a remote and informations on them.
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	details:				<aPresenter>		A presenten showing the details for a PR.
	pullRequests:		<anAdaptor>		An adaptor corresponding to a table containing the pull requests to view.
	remote:				<aRemote>			The remote we should view the PR of.

"
Class {
	#name : #IceTipGitHubPullRequestListBrowser,
	#superclass : #IceTipBrowser,
	#instVars : [
		'remote',
		'pullRequests',
		'details'
	],
	#category : #'Iceberg-Plugin-GitHub-View'
}

{ #category : #commands }
IceTipGitHubPullRequestListBrowser class >> buildGeneralCommandGroupWith: presenter for: aCommandGroup [

	aCommandGroup register: IceTipRefreshPullRequestsCommand forSpec
]

{ #category : #commands }
IceTipGitHubPullRequestListBrowser class >> buildSelectionCommandGroupWith: presenter for: aCommandGroup [

	{ 	IceTipOpenGitHubPullRequestCommand }
			do: [ :each |
				aCommandGroup register: each forSpec ]

]

{ #category : #specs }
IceTipGitHubPullRequestListBrowser class >> defaultSpec [

	^ SpPanedLayout newVertical
		  position: 30 percent;
		  add: #pullRequests;
		  add: #details;
		  yourself
]

{ #category : #'instance creation' }
IceTipGitHubPullRequestListBrowser class >> onRepository: aRepository [

	^ self on: (IceTipRepositoryModel on: aRepository)
]

{ #category : #accessing }
IceTipGitHubPullRequestListBrowser class >> taskbarIcon [

	^ self iconNamed: #komitterSmalltalkhubRemote
]

{ #category : #initialization }
IceTipGitHubPullRequestListBrowser >> connectPresenters [

	super connectPresenters.
	self pullRequests
		activateOnDoubleClick;
		whenActivatedDo: [ :selection | self strongSelection: selection ];
		whenSelectionChangedDo: [ :selection |
			self updateSelectedPullRequest: selection ].

]

{ #category : #accessing }
IceTipGitHubPullRequestListBrowser >> details [

	^ details
]

{ #category : #private }
IceTipGitHubPullRequestListBrowser >> fetchPullRequests [

	^ (IceGitHubAPI new
		getPullRequests: self remote owner project: self remote projectName) all
		collect: [ :each | 
			(IceGitHubPullRequest fromJSON: each)
				repository: self repository entity;
				yourself ]
]

{ #category : #initialization }
IceTipGitHubPullRequestListBrowser >> initialExtentForWindow [

	^ (700 @ 700) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipGitHubPullRequestListBrowser >> initializePresenters [

	super initializePresenters.
	pullRequests := self newTable.
	details := self instantiate: IceGitHubPullRequestDetailModel.
	
	self initializePullRequestsTable.

]

{ #category : #initialization }
IceTipGitHubPullRequestListBrowser >> initializePullRequestsTable [

	pullRequests
		beResizable;
		addColumn:
			(SpStringTableColumn new
				title: '#';
				evaluated: [ :pullRequest | pullRequest number asString ];
				width: 50 * self currentWorld displayScaleFactor;
				yourself);
		addColumn:
			(SpStringTableColumn new
				title: 'State';
				evaluated: #state;
				width: 50 * self currentWorld displayScaleFactor;
				yourself);
		addColumn:
			(SpStringTableColumn new
				title: 'Author';
				evaluated: #author;
				width: 120 * self currentWorld displayScaleFactor;
				yourself);
		addColumn:
			(SpStringTableColumn new
				title: 'Title';
				evaluated: #title;
				yourself)

]

{ #category : #'accessing ui' }
IceTipGitHubPullRequestListBrowser >> mainList [

	^ pullRequests
]

{ #category : #accessing }
IceTipGitHubPullRequestListBrowser >> pullRequests [

	^ pullRequests
]

{ #category : #actions }
IceTipGitHubPullRequestListBrowser >> refreshPullRequests [
	
	self pullRequests
		items: self fetchPullRequests;
		selectIndex: 1 "No error if list is empty"

]

{ #category : #accessing }
IceTipGitHubPullRequestListBrowser >> remote [

	^ remote
]

{ #category : #accessing }
IceTipGitHubPullRequestListBrowser >> remote: aRemote [

	remote := aRemote
]

{ #category : #accessing }
IceTipGitHubPullRequestListBrowser >> repository [

	^ model
]

{ #category : #private }
IceTipGitHubPullRequestListBrowser >> strongSelection: aSelection [

	self viewPullRequest: aSelection selectedItem
]

{ #category : #initialization }
IceTipGitHubPullRequestListBrowser >> titleForWindow [

	^ 'Pull requests on {1} ({2})' format: { self remote name. self remote url }
]

{ #category : #private }
IceTipGitHubPullRequestListBrowser >> updateSelectedPullRequest: aSpSingleSelectionMode [

	aSpSingleSelectionMode isEmpty ifFalse: [ 
		self details pullRequest: aSpSingleSelectionMode selectedItem ]
]

{ #category : #actions }
IceTipGitHubPullRequestListBrowser >> viewPullRequest: aPullRequest [

	UIManager default
		informUser: (
				'Opening pull request {1} {2}' format: { 
					 aPullRequest number.
					 aPullRequest title })
		during: [ 
			(IceGitHubTipPullRequestBrowser
				 on: self model
				 pullRequest: aPullRequest) openWithSpec ]
]
