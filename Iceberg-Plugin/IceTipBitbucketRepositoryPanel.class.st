Class {
	#name : #IceTipBitbucketRepositoryPanel,
	#superclass : #IceTipGitProviderRepositoryPanel,
	#category : #'Iceberg-Plugin-Bitbucket'
}

{ #category : #accessing }
IceTipBitbucketRepositoryPanel class >> order [

	^ 110
]

{ #category : #actions }
IceTipBitbucketRepositoryPanel >> configureBuilder: aBuilder [

	aBuilder beBitbucket
]

{ #category : #accessing }
IceTipBitbucketRepositoryPanel >> iconForWindow [

	^ self iconNamed: #bitbucket
]

{ #category : #accessing }
IceTipBitbucketRepositoryPanel >> providerName [

	^ 'Bitbucket'
]

{ #category : #specs }
IceTipBitbucketRepositoryPanel >> titleForWindow [

	^ 'Clone From bitbucket.org'
]
