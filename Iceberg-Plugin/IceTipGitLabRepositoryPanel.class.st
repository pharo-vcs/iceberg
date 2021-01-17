Class {
	#name : #IceTipGitLabRepositoryPanel,
	#superclass : #IceTipGitProviderRepositoryPanel,
	#category : #'Iceberg-Plugin-Gitlab'
}

{ #category : #accessing }
IceTipGitLabRepositoryPanel class >> order [

	^ 120
]

{ #category : #actions }
IceTipGitLabRepositoryPanel >> configureBuilder: aBuilder [

	aBuilder beGitLab
]

{ #category : #initialization }
IceTipGitLabRepositoryPanel >> iconForWindow [

	^ self iconNamed: #gitlab
]

{ #category : #accessing }
IceTipGitLabRepositoryPanel >> providerName [

	^ 'GitLab'
]

{ #category : #initialization }
IceTipGitLabRepositoryPanel >> titleForWindow [

	^ 'Clone From gitlab.com'
]
