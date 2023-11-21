"
I'm a generic command to perform plugin actions for GitHub.
My children define the real behavior, and they need to implement #execute.
"
Class {
	#name : 'IceGitHubCommand',
	#superclass : 'IceTipCommand',
	#category : 'Iceberg-Plugin-GitHub-Commands',
	#package : 'Iceberg-Plugin-GitHub',
	#tag : 'Commands'
}

{ #category : 'testing' }
IceGitHubCommand class >> isAbstract [

	^ self == IceGitHubCommand
]

{ #category : 'testing' }
IceGitHubCommand >> canBeExecuted [

	^ super canBeExecuted and: [ self remote url includesSubstring: 'github.com' ]
]

{ #category : 'accessing' }
IceGitHubCommand >> remote [

	^ self subclassResponsibility

]
