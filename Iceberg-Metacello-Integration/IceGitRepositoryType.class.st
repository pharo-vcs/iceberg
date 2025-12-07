"
I resolve a generic git repository.

I accept direct URLs as my parameter to form a repository using a MCGitRemoteRepository. I can parse then this kind of urls:

git:https://github.com/user/project.git
git:git@github.com:user/project.git
"
Class {
	#name : 'IceGitRepositoryType',
	#superclass : 'IceProviderRepositoryType',
	#category : 'Iceberg-Metacello-Integration-RepoTypes',
	#package : 'Iceberg-Metacello-Integration',
	#tag : 'RepoTypes'
}

{ #category : 'accessing' }
IceGitRepositoryType class >> type [

	^ 'git'
]

{ #category : 'private' }
IceGitRepositoryType >> locationTokens [

	^ self location substrings: ':/'
]

{ #category : 'accessing' }
IceGitRepositoryType >> mcRepositoryClass [
	
	^ MCGitRemoteRepository
]

{ #category : 'private' }
IceGitRepositoryType >> projectArgumentPosition [

	^ (self location beginsWith: 'git:http')
		ifTrue: [ 5 ]
		ifFalse: [ 4 ]
]

{ #category : 'accessing' }
IceGitRepositoryType >> projectName [

	 ^ (self locationTokens at: self projectArgumentPosition) copyUpTo: $.
]

{ #category : 'accessing' }
IceGitRepositoryType >> projectVersion [
	| tokens |
	
	tokens := self locationTokens.
	^ tokens size >= self versionArgumentPosition
		ifTrue: [ tokens at: self versionArgumentPosition ]
		ifFalse: [ '' ]
]

{ #category : 'private' }
IceGitRepositoryType >> versionArgumentPosition [

	^ (self location beginsWith: 'git:http')
		ifTrue: [ 6 ]
		ifFalse: [ 5 ]
]
