tests
testSameRemoteReferenceWithoutGitExtension

	| r1 r2 |
	r1 := IceRemote url: 'git@github.com:owner/repo'.
	r2 := IceRemote url: 'https://github.com/owner/repo.git'.
	self assert: (r1 referencesSameRemoteLocationAs: r2)