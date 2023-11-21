"
Description
--------------------

I am a command opening the repository page of the remote on GitHub if possible.
"
Class {
	#name : 'IceGitHubOpenOnGithubCommand',
	#superclass : 'IceGitHubRemoteCommand',
	#category : 'Iceberg-Plugin-GitHub-Commands',
	#package : 'Iceberg-Plugin-GitHub',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceGitHubOpenOnGithubCommand class >> defaultName [

	^ 'Open on github'
]

{ #category : 'executing' }
IceGitHubOpenOnGithubCommand >> execute [

	(IceGitHubOpenOnGithubAction
		organisation: self remote owner
		projectName: self remote projectName)
		executeWithContext: context
]
