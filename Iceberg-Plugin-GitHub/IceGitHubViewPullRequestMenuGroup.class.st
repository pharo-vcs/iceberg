Class {
	#name : #IceGitHubViewPullRequestMenuGroup,
	#superclass : #IceGitHubBranchSelectMenuGroup,
	#category : #'Iceberg-Plugin-GitHub-Commands'
}

{ #category : #accessing }
IceGitHubViewPullRequestMenuGroup >> description [ 
	^ 'View pull requests on the repository'
]

{ #category : #accessing }
IceGitHubViewPullRequestMenuGroup >> name [
	^'View Pull Requests ...'
]
