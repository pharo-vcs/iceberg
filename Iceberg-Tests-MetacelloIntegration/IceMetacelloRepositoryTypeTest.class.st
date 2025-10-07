Class {
	#name : 'IceMetacelloRepositoryTypeTest',
	#superclass : 'TestCase',
	#category : 'Iceberg-Tests-MetacelloIntegration',
	#package : 'Iceberg-Tests-MetacelloIntegration'
}

{ #category : 'tests' }
IceMetacelloRepositoryTypeTest >> parse: url assertType: type projectName: projectName projectVersion: projectVersion [

	| repo |
	repo := IceMetacelloRepositoryType for: url.
	self assert: repo class equals: type.
	self assert: repo projectName equals: projectName.
	self assert: repo projectVersion equals: projectVersion.
]

{ #category : 'tests' }
IceMetacelloRepositoryTypeTest >> testParsingGithub [

	self parse: 'github://pharo-project/pharo:master/src'
		assertType: IceGithubRepositoryType 
		projectName: 'pharo'
		projectVersion: 'master'.

	self parse: 'github://pharo-project/pharo:master'
		assertType: IceGithubRepositoryType 
		projectName: 'pharo'
		projectVersion: 'master'.

	self parse: 'github://pharo-project/pharo/src'
		assertType: IceGithubRepositoryType 
		projectName: 'pharo'
		projectVersion: ''.

	self parse: 'github://pharo-project/pharo/'
		assertType: IceGithubRepositoryType 
		projectName: 'pharo'
		projectVersion: ''

]

{ #category : 'tests' }
IceMetacelloRepositoryTypeTest >> testParsingGitlab [

	self parse: 'gitlab://pharo-project/pharo:master/src'
		assertType: IceGitlabRepositoryType
		projectName: 'pharo'
		projectVersion: 'master'.
			
	self parse: 'gitlab://pharo-project/pharo'
		assertType: IceGitlabRepositoryType
		projectName: 'pharo'
		projectVersion: ''.

	self parse: 'gitlab://pharo-project/pharo/src'
		assertType: IceGitlabRepositoryType
		projectName: 'pharo'
		projectVersion: ''.

	self parse: 'gitlab://pharo-project/subproject/pharo:master/src'
		assertType: IceGitlabRepositoryType
		projectName: 'pharo'
		projectVersion: 'master'.

]

{ #category : 'tests' }
IceMetacelloRepositoryTypeTest >> testParsingSelfHostedGitlab [

	self parse: 'gitlab://git.pharo.org:pharo-project/pharo:master/src'
		assertType: IceGitlabRepositoryType
		projectName: 'pharo'
		projectVersion: 'master'.
	

	self parse: 'gitlab://git.pharo.org:pharo-project/pharo:master'
		assertType: IceGitlabRepositoryType
		projectName: 'pharo'
		projectVersion: 'master'.

	self parse: 'gitlab://git.pharo.org:pharo-project/pharo'
		assertType: IceGitlabRepositoryType
		projectName: 'pharo'
		projectVersion: ''.

	self parse: 'gitlab://git.pharo.org:pharo-project/pharo'
		assertType: IceGitlabRepositoryType
		projectName: 'pharo'
		projectVersion: ''.

	self parse: 'gitlab://git.pharo.org:pharo-project/subproject/pharo:master/src'
		assertType: IceGitlabRepositoryType
		projectName: 'pharo'
		projectVersion: 'master'.

]

{ #category : 'tests' }
IceMetacelloRepositoryTypeTest >> testParsingSelfHostedGitlabWithNonLocalPort [

	self parse: 'gitlab://git.pharo.org:1234:pharo-project/pharo:master/src'
		assertType: IceGitlabRepositoryType
		projectName: 'pharo'
		projectVersion: 'master'.
	

	self parse: 'gitlab://git.pharo.org:1234:pharo-project/pharo:master'
		assertType: IceGitlabRepositoryType
		projectName: 'pharo'
		projectVersion: 'master'.

	self parse: 'gitlab://git.pharo.org:1234:pharo-project/pharo'
		assertType: IceGitlabRepositoryType
		projectName: 'pharo'
		projectVersion: ''.

	self parse: 'gitlab://git.pharo.org:1234:pharo-project/subproject/pharo:master/src'
		assertType: IceGitlabRepositoryType
		projectName: 'pharo'
		projectVersion: 'master'.

]
