"
I resolve Github repositories
"
Class {
	#name : 'IceGithubRepositoryType',
	#superclass : 'IceProviderRepositoryType',
	#category : 'Iceberg-Metacello-Integration-RepoTypes',
	#package : 'Iceberg-Metacello-Integration',
	#tag : 'RepoTypes'
}

{ #category : 'accessing' }
IceGithubRepositoryType class >> type [
	^ 'github'
]
