Class {
	#name : #IceGitHubNewBranchFromIssueCommand,
	#superclass : #IceTipCommand,
	#category : #'Iceberg-Plugin-GitHub-Commands'
}

{ #category : #testing }
IceGitHubNewBranchFromIssueCommand class >> defaultName [

	^ 'Create new branch for issue...'
]

{ #category : #testing }
IceGitHubNewBranchFromIssueCommand class >> defaultToolbarItemName [

	^ 'New issue'
]

{ #category : #execution }
IceGitHubNewBranchFromIssueCommand >> execute [

	(IceTipCheckoutBranchDialog on: self repositoryModel)
		withTypes: (IceGitHubPlugin new checkoutBranchPanelsOnModel: self repositoryModel);
		openDialogWithSpec
]

{ #category : #testing }
IceGitHubNewBranchFromIssueCommand >> iconName [

	^ #github
]

{ #category : #testing }
IceGitHubNewBranchFromIssueCommand >> shouldBeDisplayedOnRightSideInToolbar [

	^ true
]
