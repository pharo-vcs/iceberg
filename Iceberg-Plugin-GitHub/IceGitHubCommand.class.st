"
I'm a generic command to perform plugin actions for GitHub.
My children define the real behavior, and they need to implement #execute.
"
Class {
	#name : #IceGitHubCommand,
	#superclass : #IceTipCommand,
	#category : #'Iceberg-Plugin-GitHub-Commands'
}

{ #category : #testing }
IceGitHubCommand >> canBeExecuted [

	^ self remote url includesSubstring: 'github.com'
]

{ #category : #accessing }
IceGitHubCommand >> remote [

	^ self context entity

]

{ #category : #accessing }
IceGitHubCommand >> remoteModel [

	^ self context

]
