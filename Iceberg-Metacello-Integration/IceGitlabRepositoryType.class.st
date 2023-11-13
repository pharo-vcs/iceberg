"
I resolve Gilab repositories
"
Class {
	#name : 'IceGitlabRepositoryType',
	#superclass : 'IceProviderRepositoryType',
	#category : 'Iceberg-Metacello-Integration-RepoTypes',
	#package : 'Iceberg-Metacello-Integration',
	#tag : 'RepoTypes'
}

{ #category : 'accessing' }
IceGitlabRepositoryType class >> type [
	^ 'gitlab'
]
