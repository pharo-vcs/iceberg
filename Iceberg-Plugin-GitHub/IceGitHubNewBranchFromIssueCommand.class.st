Class {
	#name : 'IceGitHubNewBranchFromIssueCommand',
	#superclass : 'IceTipCommand',
	#category : 'Iceberg-Plugin-GitHub-Commands',
	#package : 'Iceberg-Plugin-GitHub',
	#tag : 'Commands'
}

{ #category : 'testing' }
IceGitHubNewBranchFromIssueCommand class >> defaultName [

	^ 'Create new branch for issue...'
]

{ #category : 'testing' }
IceGitHubNewBranchFromIssueCommand class >> defaultToolbarItemName [

	^ 'New issue'
]

{ #category : 'testing' }
IceGitHubNewBranchFromIssueCommand >> canBeExecuted [ 

	^ self repositoryModel isNotNil
]

{ #category : 'executing' }
IceGitHubNewBranchFromIssueCommand >> execute [

	(IceTipCheckoutBranchDialog on: self repositoryModel)
		withTypes: (IceGitHubPlugin new checkoutBranchPanelsOnModel: self repositoryModel);
		openDialog
]

{ #category : 'testing' }
IceGitHubNewBranchFromIssueCommand >> iconName [

	^ #github
]

{ #category : 'testing' }
IceGitHubNewBranchFromIssueCommand >> shouldBeDisplayedOnRightSideInToolbar [

	^ true
]
