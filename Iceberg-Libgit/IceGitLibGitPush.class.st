"
I implement the push with libgit2
"
Class {
	#name : 'IceGitLibGitPush',
	#superclass : 'Object',
	#instVars : [
		'repository',
		'branch',
		'remote'
	],
	#category : 'Iceberg-Libgit-GitActions',
	#package : 'Iceberg-Libgit',
	#tag : 'GitActions'
}

{ #category : 'testing' }
IceGitLibGitPush class >> requiresSubprocessLib [

	^ false
]

{ #category : 'accessing' }
IceGitLibGitPush >> branch: anIceGitLocalBranch [

	branch := anIceGitLocalBranch
]

{ #category : 'executing' }
IceGitLibGitPush >> execute [
	
	branch doPushTo: remote
]

{ #category : 'accessing' }
IceGitLibGitPush >> remote: anIceGitScpRemote [ 
	
	remote := anIceGitScpRemote
]

{ #category : 'accessing' }
IceGitLibGitPush >> repository: anIceLibgitRepository [

	repository := anIceLibgitRepository
]
