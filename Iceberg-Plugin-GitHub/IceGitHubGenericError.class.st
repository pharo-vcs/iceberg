"
I'm an error that happens when something went wrong on GitHub API operations.
"
Class {
	#name : 'IceGitHubGenericError',
	#superclass : 'IceGitHubError',
	#category : 'Iceberg-Plugin-GitHub-Model',
	#package : 'Iceberg-Plugin-GitHub',
	#tag : 'Model'
}

{ #category : 'testing' }
IceGitHubGenericError class >> isAppropriateFor: aResponse [
	^ aResponse status = 422
]
