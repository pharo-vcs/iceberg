"
I resolve Gilab repositories
"
Class {
	#name : #IceGitlabRepositoryType,
	#superclass : #IceProviderRepositoryType,
	#category : #'Iceberg-Metacello-Integration-RepoTypes'
}

{ #category : #accessing }
IceGitlabRepositoryType class >> type [
	^ 'gitlab'
]
