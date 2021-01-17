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

{ #category : #initialization }
IceTipBitbucketRepositoryPanel >> iconForWindow [

	^ self iconNamed: #bitbucket
]

{ #category : #accessing }
IceTipBitbucketRepositoryPanel >> providerName [

	^ 'Bitbucket'
]

{ #category : #initialization }
IceTipBitbucketRepositoryPanel >> titleForWindow [

	^ 'Clone From bitbucket.org'
]
