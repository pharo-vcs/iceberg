"
I'm a presenter to define a new remote repository from a GitHub repository (owner/project).

"
Class {
	#name : 'IceTipGitHubRepositoryPanel',
	#superclass : 'IceTipGitProviderRepositoryPanel',
	#category : 'Iceberg-Plugin-GitHub-View',
	#package : 'Iceberg-Plugin-GitHub',
	#tag : 'View'
}

{ #category : 'accessing' }
IceTipGitHubRepositoryPanel class >> order [

	^ 100
]

{ #category : 'accessing' }
IceTipGitHubRepositoryPanel >> configureBuilder: aBuilder [

	aBuilder beGithub
]

{ #category : 'querying - github' }
IceTipGitHubRepositoryPanel >> getGitHubRepository [

	^ [ [ IceGitHubAPI new
		  beAnonymous;
		  getRepository: self userName project: self projectName ]
		  on: LGitNoCredentialsProvided
		  do: [ nil ] ]
		  on: IceGitHubError
		  do: [ :error | 
			"If not found, probably means a private repository => ignore it"
			error messageText = 'Not Found'
				ifTrue: [ ^ nil ].
			error pass ]
]

{ #category : 'initialization' }
IceTipGitHubRepositoryPanel >> iconForWindow [

	^ (self iconNamed: #github) lighter: 0.50 "just to be sure is visible in all themes"
]

{ #category : 'accessing' }
IceTipGitHubRepositoryPanel >> newRepository [

	| newRepository |
	newRepository := super newRepository.
	self application
		informUser: 'Configuring Remotes...'
		during: [ | githubRepository |
			githubRepository := self getGitHubRepository.
			githubRepository ifNil: [ ^ newRepository ].
			(githubRepository at: #fork)
				ifTrue: [ | parent remote |
					parent := githubRepository at: #parent.
					remote := IceGitRemote
						name: ((parent at: #owner) at: #login)
						url: (parent at: self selectedProtocol githubRequestUrlKey).
					newRepository addRemote: remote.
					remote fetch. ] ].
	^ newRepository

]

{ #category : 'accessing' }
IceTipGitHubRepositoryPanel >> providerName [

	^ 'GitHub'
]

{ #category : 'initialization' }
IceTipGitHubRepositoryPanel >> titleForWindow [

	^ 'Clone from github.com'
]
