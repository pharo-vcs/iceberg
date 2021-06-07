"
I resolve Github repositories
"
Class {
	#name : #IceGithubRepositoryType,
	#superclass : #IceProviderRepositoryType,
	#category : #'Iceberg-Metacello-Integration-RepoTypes'
}

{ #category : #accessing }
IceGithubRepositoryType class >> type [
	^ 'github'
]

{ #category : #accessing }
IceGithubRepositoryType >> mcRepository [
	| baseRepo |
	
	self guessRegisteredRepository
		ifNotNil: [ :repo | 
			repo isValid ifTrue: [ ^ repo metacelloAdapter: self projectVersion  ].
			"If the repo is not valid, we forget it and reget a new one. Because Metacello want to use it"
			repo forget	].
		
	baseRepo := self mcRepositoryClass location: self location.
	^ (Iceberg icebergRepositoriesURLs includes: baseRepo scpUrl)
		ifTrue: [ 
			"Do not use Iceberg to load iceberg code, 
			see https://github.com/pharo-vcs/iceberg/issues/168"
			baseRepo ]
		ifFalse: [  
			baseRepo getOrCreateIcebergRepository metacelloAdapter: self projectVersion ]
		
]
