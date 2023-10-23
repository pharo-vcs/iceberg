"
A remote repository created out of a git  url, such as 'git://localhost/owner/repository.git'.


"
Class {
	#name : 'IceGitSshRemote',
	#superclass : 'IceGitNetworkRemote',
	#category : 'Iceberg-Libgit-Core',
	#package : 'Iceberg-Libgit',
	#tag : 'Core'
}

{ #category : 'testing' }
IceGitSshRemote class >> canHandleUrl: aRepositoryUrl [
	^ aRepositoryUrl beginsWith: 'git://'
]

{ #category : 'accessing - defaults' }
IceGitSshRemote class >> defaultPort [
	^9418
]

{ #category : 'private - patches' }
IceGitSshRemote >> httpsUrl [
	^ 'https://{1}/{2}.git' format: { self host . self projectPath }

]
