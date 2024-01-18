"
Unit test for IceScpRemote
"
Class {
	#name : 'IceScpRemoteTest',
	#superclass : 'TestCase',
	#category : 'Iceberg-Tests-Core-Remotes',
	#package : 'Iceberg-Tests',
	#tag : 'Core-Remotes'
}

{ #category : 'support' }
IceScpRemoteTest >> gitoliteUrl1 [
	^ 'gitolite3@server.bogus.edu:reponame'
]

{ #category : 'support' }
IceScpRemoteTest >> gitoliteUrl2 [
	^ 'ssh://gitolite3@server.bogus.edu/reponame'
]

{ #category : 'tests' }
IceScpRemoteTest >> testCanHandleGitProtocol [

	self assert: (IceGitScpRemote canHandleUrl: 'git@github.com:owner/repo.git')
]

{ #category : 'tests' }
IceScpRemoteTest >> testCanHandleGitoliteProtocol1 [		
	self assert: (IceGitScpRemote canHandleUrl: self gitoliteUrl1)
]

{ #category : 'tests' }
IceScpRemoteTest >> testCanHandleGitoliteProtocol2 [		
	self assert: (IceGitScpRemote canHandleUrl: self gitoliteUrl2)
]

{ #category : 'tests' }
IceScpRemoteTest >> testCanHandleSSHProtocol [

	self assert: (IceGitScpRemote canHandleUrl: 'ssh://github.com:owner/repo.git')
]

{ #category : 'tests' }
IceScpRemoteTest >> testGitHubURL [
	| remote |
	remote := IceGitRemote url: 'git@github.com:owner/repo.git'.
	self 
		assert: remote host equals: 'github.com';
		assert: remote owner equals: 'owner';
		assert: remote path isEmpty;
		assert: remote projectName equals: 'repo'.
]

{ #category : 'tests' }
IceScpRemoteTest >> testGitoliteURL1 [
	| remote |
	remote := IceGitRemote url: self gitoliteUrl1.
	self
		assert: remote host equals: 'server.bogus.edu';
		assert: remote owner equals: nil;
		assert: remote path isEmpty;
		assert: remote projectName equals: 'reponame'
]

{ #category : 'tests' }
IceScpRemoteTest >> testGitoliteURL2 [
	| remote |
	remote := IceGitRemote url: self gitoliteUrl2.
	self
		assert: remote host equals: 'server.bogus.edu';
		assert: remote owner equals: nil;
		assert: remote path isEmpty;
		assert: remote projectName equals: 'reponame'
]

{ #category : 'tests' }
IceScpRemoteTest >> testSameRemoteReference [

	| r1 r2 |
	r1 := IceGitRemote url: 'git@github.com:owner/repo.git'.
	r2 := IceGitRemote url: 'https://github.com/owner/repo.git'.
	self assert: (r1 referencesSameRemoteLocationAs: r2)
]

{ #category : 'tests' }
IceScpRemoteTest >> testSameRemoteReferenceWithoutGitExtension [

	| r1 r2 |
	r1 := IceGitRemote url: 'git@github.com:owner/repo'.
	r2 := IceGitRemote url: 'https://github.com/owner/repo.git'.
	self assert: (r1 referencesSameRemoteLocationAs: r2)
]

{ #category : 'tests' }
IceScpRemoteTest >> testSshUrl [
	| remote |
	remote := IceGitRemote url: 'git@github.com:npasserini/pharo-git.git'.
	self assert: remote host equals: 'github.com'.
	self assert: remote owner equals: 'npasserini'.
	self assert: remote projectName equals: 'pharo-git'.
]
