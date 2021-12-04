"
I resolve Bitbucket repositories
"
Class {
	#name : #IceBitbucketRepositoryType,
	#superclass : #IceProviderRepositoryType,
	#category : #'Iceberg-Metacello-Integration-RepoTypes'
}

{ #category : #accessing }
IceBitbucketRepositoryType class >> type [
	^ 'bitbucket'
]
