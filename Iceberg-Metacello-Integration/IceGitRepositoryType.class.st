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

{ #category : 'accessing' }
IceGitRepositoryType >> mcRepositoryClass [
	
	^ MCGitRemoteRepository
]
