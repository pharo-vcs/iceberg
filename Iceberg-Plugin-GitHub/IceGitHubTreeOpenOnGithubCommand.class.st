"
Description
--------------------

I am a command opening the repository page of the remote on GitHub if possible.
"
Class {
	#name : 'IceGitHubTreeOpenOnGithubCommand',
	#superclass : 'IceGitHubTreeCommand',
	#category : 'Iceberg-Plugin-GitHub-Commands',
	#package : 'Iceberg-Plugin-GitHub',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceGitHubTreeOpenOnGithubCommand class >> defaultName [

	^ 'Open on github'
]

{ #category : 'executing' }
IceGitHubTreeOpenOnGithubCommand >> execute [

	(IceGitHubOpenOnGithubAction
		organisation: self remote owner
		projectName: self remote projectName) 
		executeWithContext: context
]
