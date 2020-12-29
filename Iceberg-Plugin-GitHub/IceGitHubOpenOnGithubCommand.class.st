"
Description
--------------------

I am a command opening the repository page of the remote on GitHub if possible.
"
Class {
	#name : #IceGitHubOpenOnGithubCommand,
	#superclass : #IceGitHubRemoteCommand,
	#category : #'Iceberg-Plugin-GitHub-Commands'
}

{ #category : #accessing }
IceGitHubOpenOnGithubCommand class >> defaultName [

	^ 'Open on github'
]

{ #category : #execute }
IceGitHubOpenOnGithubCommand >> execute [

	(IceGitHubOpenOnGithubAction
		 organisation: self remote owner
		 projectName: self remote projectName) execute
]
