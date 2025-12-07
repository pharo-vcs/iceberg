Class {
	#name : 'MCGitRemoteRepositoryTest',
	#superclass : 'TestCase',
	#category : 'Iceberg-Tests',
	#package : 'Iceberg-Tests'
}

{ #category : 'tests' }
MCGitRemoteRepositoryTest >> testSSHRepoWithBranch [
	| repo remoteRepo |
	
	repo := IceGitRepositoryType location: 'git:git@forge.aplaceinthe.eu:estebanlm/ASuperProject.git:main'.
	remoteRepo := MCGitRemoteRepository 
		location: repo location 
		version: repo projectVersion.
		
	self assert: remoteRepo scpUrl equals: 'git@forge.aplaceinthe.eu:estebanlm/ASuperProject.git'.
	self assert: remoteRepo projectVersion equals: 'main'
]

{ #category : 'tests' }
MCGitRemoteRepositoryTest >> testSSHRepoWithCommitish [
	| repo remoteRepo |
	
	repo := IceGitRepositoryType location: 'git:git@forge.aplaceinthe.eu:estebanlm/ASuperProject.git:a05016fbcdb465e819a1e04aba4943b993b3e835'.
	remoteRepo := MCGitRemoteRepository 
		location: repo location 
		version: repo projectVersion.
		
	self assert: remoteRepo scpUrl equals: 'git@forge.aplaceinthe.eu:estebanlm/ASuperProject.git'.
	self assert: remoteRepo projectVersion equals: 'a05016fbcdb465e819a1e04aba4943b993b3e835'
]

{ #category : 'tests' }
MCGitRemoteRepositoryTest >> testSSHRepoWithTag [
	| repo remoteRepo |
	
	repo := IceGitRepositoryType location: 'git:git@forge.aplaceinthe.eu:estebanlm/ASuperProject.git:v1.0.0'.
	remoteRepo := MCGitRemoteRepository 
		location: repo location 
		version: repo projectVersion.
		
	self assert: remoteRepo scpUrl equals: 'git@forge.aplaceinthe.eu:estebanlm/ASuperProject.git'.
	self assert: remoteRepo projectVersion equals: 'v1.0.0'
]

{ #category : 'tests' }
MCGitRemoteRepositoryTest >> testSSHRepoWithoutVersion [
	| repo remoteRepo |
	
	self flag: #TODO. "This is how it was working before, but I do not think there should be a 
	default branch anymore..."
	
	repo := IceGitRepositoryType location: 'git:git@forge.aplaceinthe.eu:estebanlm/ASuperProject.git'.
	remoteRepo := MCGitRemoteRepository 
		location: repo location 
		version: repo projectVersion.
		
	self assert: remoteRepo scpUrl equals: 'git@forge.aplaceinthe.eu:estebanlm/ASuperProject.git'.
	self assert: remoteRepo projectVersion equals: 'master'
]
