Class {
	#name : 'MCGitlabRepositoryIcebergExtensionsTest',
	#superclass : 'TestCase',
	#category : 'Iceberg-Tests-Core-Remotes',
	#package : 'Iceberg-Tests',
	#tag : 'Core-Remotes'
}

{ #category : 'running' }
MCGitlabRepositoryIcebergExtensionsTest >> testHttpsUrl [

	| repository |

	repository := MCGitlabRepository location: 'gitlab://pharo-project/pharo:master'.
	self assert: repository httpsUrl equals: 'https://gitlab.com/pharo-project/pharo.git'
]

{ #category : 'running' }
MCGitlabRepositoryIcebergExtensionsTest >> testHttpsUrlForSelfHostedGitlab [

	| repository |

	(SystemVersion current major <= 6) ifTrue: [self skip].
	repository := MCGitlabRepository location: 'gitlab://git.pharo.org:pharo-project/pharo:master'.
	self assert: repository httpsUrl equals: 'https://git.pharo.org/pharo-project/pharo.git'

]

{ #category : 'running' }
MCGitlabRepositoryIcebergExtensionsTest >> testScpUrl [

	| repository |

	repository := MCGitlabRepository location: 'gitlab://pharo-project/pharo:master'.
	self assert: repository scpUrl equals: 'git@gitlab.com:pharo-project/pharo.git'
]

{ #category : 'running' }
MCGitlabRepositoryIcebergExtensionsTest >> testScpUrlForSelfHostedGitlab [

	| repository |

	(SystemVersion current major <= 6) ifTrue: [self skip].
	repository := MCGitlabRepository location: 'gitlab://git.pharo.org:pharo-project/pharo:master'.
	self assert: repository scpUrl equals: 'git@git.pharo.org:pharo-project/pharo.git'

]

{ #category : 'running' }
MCGitlabRepositoryIcebergExtensionsTest >> testScpUrlForSelfHostedGitlabWithNonDefaultSSHPort [
	| repository |
	SystemVersion current major <= 6 ifTrue: [ self skip ].

	repository := MCGitlabRepository location: 'gitlab://git.pharo.org:1234:pharo-project/pharo'.
	self assert: repository scpUrl equals: 'ssh://git@git.pharo.org:1234/pharo-project/pharo.git'
]
