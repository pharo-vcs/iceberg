"
I am a repository managing projects hosted on generic git repositories.

I accept urls of the kind: 

https://github.com/user/project.git
git@github.com:user/project.git

WARNING: This repository is meant to be used with iceberg and it will not work with plain Monticello/Metacello (because there is no way to know how to download a zip)
"
Class {
	#name : 'MCGitRemoteRepository',
	#superclass : 'MCGitBasedNetworkRepository',
	#instVars : [
		'host',
		'port',
		'path',
		'user'
	],
	#category : 'Iceberg-Metacello-Integration-RepoTypes',
	#package : 'Iceberg-Metacello-Integration',
	#tag : 'RepoTypes'
}

{ #category : 'accessing' }
MCGitRemoteRepository class >> basicDescription [

  ^ 'git'
]

{ #category : 'accessing' }
MCGitRemoteRepository class >> description [

  ^ self basicDescription , ':'
]

{ #category : 'private' }
MCGitRemoteRepository class >> parseLocation: aLocation version: aVersion [ 

	^ self new
	parseLocation: (aLocation allButFirst: self description size);
	yourself 
]

{ #category : 'accessing' }
MCGitRemoteRepository >> host [

	^ host
]

{ #category : 'accessing' }
MCGitRemoteRepository >> httpsUrl [

	^ 'https://{1}{2}/{3}.git' format: { 
		self host. 
		self port 
			ifNotNil: [ ':', self port asString ]
			ifNil: [ '' ].
		self path }
]

{ #category : 'initialization' }
MCGitRemoteRepository >> initialize [
	
	super initialize.
]

{ #category : 'private - initialization' }
MCGitRemoteRepository >> parseHTTPLocation: aString [
	| url |

	url := aString asUrl.
	host := url host.
	port := url port.
	path := self pathFrom: url path
]

{ #category : 'private - initialization' }
MCGitRemoteRepository >> parseLocation: aString [

	(#('http:' 'https:') 
		anySatisfy: [ :each | aString beginsWith: each ])
		ifTrue: [ self parseHTTPLocation: aString ]
		ifFalse: [ self parseSSHLocation: aString ]
]

{ #category : 'private - initialization' }
MCGitRemoteRepository >> parseSSHLocation: aString [
	| segments |
	
	segments := aString substrings: '@:'.
	user := segments first.
	host := segments second.
	path := self pathFrom: segments third
]

{ #category : 'accessing' }
MCGitRemoteRepository >> path [

	^ path
]

{ #category : 'private - initialization' }
MCGitRemoteRepository >> pathFrom: aString [

	^ (aString endsWith: '.git')
		ifTrue: [ aString allButLast: 4 ]
		ifFalse: [ aString ]
]

{ #category : 'accessing' }
MCGitRemoteRepository >> port [

	^ port
]

{ #category : 'accessing' }
MCGitRemoteRepository >> projectPath [

	^ self path
]

{ #category : 'accessing' }
MCGitRemoteRepository >> scpUrl [

	^ '{1}@{2}/{3}.git' format: { 
		self user. 
		self host. 
		self path }
]

{ #category : 'accessing' }
MCGitRemoteRepository >> user [

	^ user
]
