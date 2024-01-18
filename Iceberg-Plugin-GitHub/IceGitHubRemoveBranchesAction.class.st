"
I'm an action to remove branches from remotes.
"
Class {
	#name : 'IceGitHubRemoveBranchesAction',
	#superclass : 'IceGitHubAction',
	#instVars : [
		'branches',
		'branchesByName'
	],
	#category : 'Iceberg-Plugin-GitHub-Commands',
	#package : 'Iceberg-Plugin-GitHub',
	#tag : 'Commands'
}

{ #category : 'execute' }
IceGitHubRemoveBranchesAction >> basicExecute [
	credentials := IceGitHubAPI ensureCredentials.	
	context application
		informUser: ('Retrieving branch information from {1}' format: {self remote url})
		during: [ self cacheAllBranches ].
	
	((IceGitHubRemoveBranchesModel newApplication: context application)
		remote: remote;
		items: branchesByName values ;
		onAccept: [ :selection | self removeBranches: selection ];
		asDialogWindow)
			centeredRelativeTo: context window;
			open
]

{ #category : 'private' }
IceGitHubRemoveBranchesAction >> cacheAllBranches [
	self remoteBranches do: [ :each | | branchName |
		branchName := each at: 'name'.
		branchesByName 
			at: branchName 
			ifAbsentPut: [ self remoteBranch: branchName ] ]
]

{ #category : 'initialization' }
IceGitHubRemoveBranchesAction >> initialize [ 
	super initialize.
	branchesByName := OrderedDictionary new
]

{ #category : 'private' }
IceGitHubRemoveBranchesAction >> remoteBranch: aName [
	^ self requestRemoteBranch: aName
]

{ #category : 'private' }
IceGitHubRemoveBranchesAction >> remoteBranches [
	^ branches ifNil: [ branches := self requestRemoteBranches ]
]

{ #category : 'actions' }
IceGitHubRemoveBranchesAction >> removeBranch: json [

	| branchName |
	branchName := json at: 'name'.
	IceGitHubAPI new
		credentials: self credentials;
		deleteBranch: self remote owner
		project: self remote projectBasename
		name: branchName.
	self application
		title: ('Branch {1} removed.' format: { branchName });
		openModal
]

{ #category : 'actions' }
IceGitHubRemoveBranchesAction >> removeBranches: aCollection [
	[ 
		aCollection do: [ :each | self removeBranch: each ] ]
	on: IceGitHubError do: [ :e | self reportError: e ]
]

{ #category : 'private' }
IceGitHubRemoveBranchesAction >> requestRemoteBranch: aName [
	^ IceGitHubAPI new
		getBranch: self remote owner 
		project: self remote projectBasename
		name: aName
]

{ #category : 'private' }
IceGitHubRemoveBranchesAction >> requestRemoteBranches [
	^ IceGitHubAPI new
		getBranches: self remote owner 
		project: self remote projectBasename
]
