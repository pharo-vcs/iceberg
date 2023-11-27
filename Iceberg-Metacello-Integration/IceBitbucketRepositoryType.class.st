"
I resolve Bitbucket repositories
"
Class {
	#name : 'IceBitbucketRepositoryType',
	#superclass : 'IceProviderRepositoryType',
	#category : 'Iceberg-Metacello-Integration-RepoTypes',
	#package : 'Iceberg-Metacello-Integration',
	#tag : 'RepoTypes'
}

{ #category : 'accessing' }
IceBitbucketRepositoryType class >> type [
	^ 'bitbucket'
]
