"
I implement the fetch using libgit2
"
Class {
	#name : 'IceGitLibGitFetch',
	#superclass : 'Object',
	#instVars : [
		'remote',
		'repository',
		'spec'
	],
	#category : 'Iceberg-Libgit-GitActions',
	#package : 'Iceberg-Libgit',
	#tag : 'GitActions'
}

{ #category : 'testing' }
IceGitLibGitFetch class >> requiresSubprocessLib [

	^ false
]

{ #category : 'executing' }
IceGitLibGitFetch >> execute [

	remote doFetchWithRefSpec: spec.

]

{ #category : 'accessing' }
IceGitLibGitFetch >> remote [

	^ remote
]

{ #category : 'accessing' }
IceGitLibGitFetch >> remote: anObject [

	remote := anObject
]

{ #category : 'accessing' }
IceGitLibGitFetch >> repository [

	^ repository
]

{ #category : 'accessing' }
IceGitLibGitFetch >> repository: anObject [

	repository := anObject
]

{ #category : 'accessing' }
IceGitLibGitFetch >> spec [

	^ spec
]

{ #category : 'accessing' }
IceGitLibGitFetch >> spec: anObject [

	spec := anObject
]
