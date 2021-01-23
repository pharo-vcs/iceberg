"
I'm a dialog to ask for data relevant to create a pull request.
"
Class {
	#name : #IceGitHubCreatePullRequestModel,
	#superclass : #IceTipSpPresenter,
	#instVars : [
		'repository',
		'titleLabel',
		'titlePanel',
		'headLabel',
		'headForkList',
		'headBranchList',
		'baseLabel',
		'baseForkList',
		'baseBranchList',
		'bodyLabel',
		'bodyPanel',
		'acceptBlock',
		'availableRemotes',
		'availableBranchNames',
		'baseRemote',
		'gitRepositoryInfo',
		'credentials',
		'baseBranches',
		'headRemote'
	],
	#category : #'Iceberg-Plugin-GitHub-View'
}

{ #category : #specs }
IceGitHubCreatePullRequestModel class >> defaultSpec [

	^ SpBoxLayout newVertical
		add:
			(SpBoxLayout newHorizontal
				add: #titleLabel
					withConstraints:
						[ :constraints | constraints width: 80 * self currentWorld displayScaleFactor ];
				add: #titlePanel;
				yourself)
			withConstraints:
				[ :constraints | constraints height: 25 * self currentWorld displayScaleFactor ];
		add:
			(SpBoxLayout newHorizontal
				add: #headLabel
					withConstraints:
						[ :constraints | constraints width: 80 * self currentWorld displayScaleFactor ];
				add: #headForkList;
				add: #headBranchList;
				yourself)
			withConstraints:
				[ :constraints | constraints height: 25 * self currentWorld displayScaleFactor ];
		add:
			(SpBoxLayout newHorizontal
				add: #baseLabel
					withConstraints:
						[ :constraints | constraints width: 80 * self currentWorld displayScaleFactor ];
				add: #baseForkList;
				add: #baseBranchList;
				yourself)
			withConstraints:
				[ :constraints | constraints height: 25 * self currentWorld displayScaleFactor ];
		add:
			(SpBoxLayout newHorizontal
				add: #bodyLabel
					withConstraints:
						[ :constraints | constraints width: 80 * self currentWorld displayScaleFactor ];
				add: #bodyPanel;
				yourself );
			yourself
]

{ #category : #'instance creation' }
IceGitHubCreatePullRequestModel class >> new [
	self error: 'Use #repository:credentials:headRemote:'
]

{ #category : #'instance creation' }
IceGitHubCreatePullRequestModel class >> repository: aRepository credentials: aCredentials headRemote: aRemote [

	^ self basicNew
		  initializeRepository: aRepository
		  credentials: aCredentials
		  headRemote: aRemote;
		  yourself
]

{ #category : #actions }
IceGitHubCreatePullRequestModel >> accept [

	| title |
	title := self titlePanel text trim.
	title ifEmpty: [ 
		UIManager default alert: 'You need to specify a title for the pull request.' title: 'Error'. 
		^ self ].
	
	acceptBlock ifNotNil: [ 
		acceptBlock cull: self createPullRequest ].
	
	self closeWindow
]

{ #category : #accessing }
IceGitHubCreatePullRequestModel >> availableBranchNames [

	^ availableBranchNames ifNil: [ 
		  availableBranchNames := self obtainAvailableBranchNames ]
]

{ #category : #accessing }
IceGitHubCreatePullRequestModel >> availableRemotes [
	"Retrieves available remotes to perform the PR"

	^ availableRemotes ifNil: [ 
		  availableRemotes := self obtainAvailableRemotes ]
]

{ #category : #'accessing ui' }
IceGitHubCreatePullRequestModel >> baseBranchList [
	^ baseBranchList
]

{ #category : #private }
IceGitHubCreatePullRequestModel >> baseBranchNames [

	^ self baseBranches collect: [ :each | each at: #name ]
]

{ #category : #private }
IceGitHubCreatePullRequestModel >> baseBranches [

	^ baseBranches ifNil: [ baseBranches := self requestBaseBranches ]
]

{ #category : #accessing }
IceGitHubCreatePullRequestModel >> baseDefaultBranchName [

	^ self gitBase at: #default_branch
]

{ #category : #'accessing ui' }
IceGitHubCreatePullRequestModel >> baseForkList [
	^ baseForkList
]

{ #category : #'accessing ui' }
IceGitHubCreatePullRequestModel >> baseLabel [
	^ baseLabel
]

{ #category : #accessing }
IceGitHubCreatePullRequestModel >> baseRemote [
	"This is the 'base' remote (the place where the repository is forked). This is used to 
	 suggest fork PR destination (base)"

	^ baseRemote ifNil: [ baseRemote := self obtainBaseRemote ]
]

{ #category : #'accessing ui' }
IceGitHubCreatePullRequestModel >> bodyLabel [
	^ bodyLabel
]

{ #category : #'accessing ui' }
IceGitHubCreatePullRequestModel >> bodyPanel [
	^ bodyPanel
]

{ #category : #accessing }
IceGitHubCreatePullRequestModel >> branch [

	^ self repository branch
]

{ #category : #private }
IceGitHubCreatePullRequestModel >> createPullRequest [

	^ IceGitHubPullRequestDefinition new 
		credentials: self credentials;
		title: self titlePanel text trim;
		headRemote: self headForkList selectedItem;
		headBranchName: self headBranchList selectedItem;
		baseRemote: self baseForkList selectedItem;
		baseBranchName: self baseBranchList selectedItem;
		body: self bodyPanel text asString trim;
		yourself
]

{ #category : #accessing }
IceGitHubCreatePullRequestModel >> credentials [

	^ credentials
]

{ #category : #accessing }
IceGitHubCreatePullRequestModel >> credentials: aCredentials [

	credentials := aCredentials
]

{ #category : #accessing }
IceGitHubCreatePullRequestModel >> defaultBaseBranchName [

	self hasParent ifFalse: [ ^ self baseDefaultBranchName ].
	^ self baseBranchNames
		  detect: [ :each | each = self branch shortname ]
		  ifNone: [ self baseDefaultBranchName ]
]

{ #category : #accessing }
IceGitHubCreatePullRequestModel >> defaultHeadBranchName [

	^ self branch shortname
]

{ #category : #private }
IceGitHubCreatePullRequestModel >> gitBase [

	| json |
	json := self gitRepositoryInfo.
	^ json at: #parent ifAbsent: [ json ]
]

{ #category : #private }
IceGitHubCreatePullRequestModel >> gitRepositoryInfo [

	^ gitRepositoryInfo ifNil: [ 
		  gitRepositoryInfo := self requestGitRepositoryInfo ]
]

{ #category : #private }
IceGitHubCreatePullRequestModel >> hasParent [

	^ self gitRepositoryInfo includesKey: #parent
]

{ #category : #'accessing ui' }
IceGitHubCreatePullRequestModel >> headBranchList [
	^ headBranchList
]

{ #category : #'accessing ui' }
IceGitHubCreatePullRequestModel >> headForkList [
	^ headForkList
]

{ #category : #'accessing ui' }
IceGitHubCreatePullRequestModel >> headLabel [
	^ headLabel
]

{ #category : #accessing }
IceGitHubCreatePullRequestModel >> headRemote [

	^ headRemote ifNil: [ self repository head upstream remote ]
]

{ #category : #initialization }
IceGitHubCreatePullRequestModel >> initialExtentForWindow [

	^ (500 @ 300) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceGitHubCreatePullRequestModel >> initializeDialogWindow: aWindow [

	aWindow
		addButton: 'Create pull request'
		do: [ self accept ]
]

{ #category : #initialization }
IceGitHubCreatePullRequestModel >> initializePresenters [

	super initializePresenters.
	titleLabel := self newLabel.
	titlePanel := self newTextInput
		autoAccept: true;
		yourself.
	headLabel := self newLabel.
	headForkList := self newDropList.
	headBranchList := self newDropList.
	baseLabel := self newLabel.
	baseForkList := self newDropList.
	baseBranchList := self newDropList.
	bodyLabel := self newLabel.
	bodyPanel := self newText
		autoAccept: true;
		yourself.

	titleLabel label: 'Title'.
	headLabel label: 'From (Head)'.
	baseLabel label: 'To (Base)'.
	bodyLabel label: 'Comment'
]

{ #category : #initialization }
IceGitHubCreatePullRequestModel >> initializeRepository: aRepository credentials: aCredentials headRemote: aRemote [

	repository := aRepository.
	credentials := aCredentials.
	headRemote := aRemote.
	self initialize
]

{ #category : #private }
IceGitHubCreatePullRequestModel >> obtainAvailableBranchNames [

	^ ((self repository allBranches collect: #shortname as: Set)
			addAll: self baseBranchNames;
			asArray)
			sort

]

{ #category : #private }
IceGitHubCreatePullRequestModel >> obtainAvailableRemotes [

	| remotes |
	remotes := self repository remotes.
	(remotes includes: self baseRemote)
		ifFalse: [ remotes := remotes copyWith: self baseRemote ].
	^ remotes	

]

{ #category : #private }
IceGitHubCreatePullRequestModel >> obtainBaseRemote [

	| base |
	base := self gitBase.
	^ IceGitRemote url:
		  ((base at: #git_url) copyReplaceAll: 'git://' with: 'https://')
]

{ #category : #private }
IceGitHubCreatePullRequestModel >> obtainLastCommitMessage [

	^ self branch commit comment
]

{ #category : #events }
IceGitHubCreatePullRequestModel >> onAccept: aBlock [

	acceptBlock := aBlock
]

{ #category : #accessing }
IceGitHubCreatePullRequestModel >> repository [

	^ repository
]

{ #category : #'private request' }
IceGitHubCreatePullRequestModel >> requestBaseBranches [

	^ IceGitHubAPI new
		  credentials: self credentials;
		  getBranches: self baseRemote owner
		  project: self baseRemote projectBasename
]

{ #category : #'private request' }
IceGitHubCreatePullRequestModel >> requestGitRepositoryInfo [

	| remote |
	remote := self headRemote.
	^ IceGitHubAPI new
		  credentials: self credentials;
		  getRepository: remote owner project: remote projectBasename
]

{ #category : #specs }
IceGitHubCreatePullRequestModel >> titleForWindow [

	^ 'New pull request'
]

{ #category : #'accessing ui' }
IceGitHubCreatePullRequestModel >> titleLabel [

	^ titleLabel
]

{ #category : #'accessing ui' }
IceGitHubCreatePullRequestModel >> titlePanel [

	^ titlePanel
]
