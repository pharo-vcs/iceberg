Class {
	#name : 'IceGitRepositoryTypeTest',
	#superclass : 'TestCase',
	#category : 'Iceberg-Tests',
	#package : 'Iceberg-Tests'
}

{ #category : 'accessing' }
IceGitRepositoryTypeTest >> repoHTTPS [
	
	^ IceGitRepositoryType location: 'git:https://forge.aplaceinthe.eu/estebanlm/ASuperProject.git:main'
]

{ #category : 'accessing' }
IceGitRepositoryTypeTest >> repoSSH [
	
	^ IceGitRepositoryType location: 'git:git@forge.aplaceinthe.eu:estebanlm/ASuperProject.git:main'
]

{ #category : 'tests' }
IceGitRepositoryTypeTest >> testProjectNameIfHTTPSForm [
	| type |

	type := self repoHTTPS.
	self assert: type projectName equals: 'ASuperProject'
]

{ #category : 'tests' }
IceGitRepositoryTypeTest >> testProjectNameIfSSHForm [
	| type |
	
	type := self repoSSH.
	self assert: type projectName equals: 'ASuperProject'
]

{ #category : 'tests' }
IceGitRepositoryTypeTest >> testProjectVersionIfHTTPSForm [
	| type |

	type := self repoHTTPS.
	self assert: type projectVersion equals: 'main'
]

{ #category : 'tests' }
IceGitRepositoryTypeTest >> testProjectVersionIfSSHForm [
	| type |

	type := self repoSSH.
	self assert: type projectVersion equals: 'main'
]
