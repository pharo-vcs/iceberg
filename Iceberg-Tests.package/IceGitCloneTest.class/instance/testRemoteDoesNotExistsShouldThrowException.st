tests
testRemoteDoesNotExistsShouldThrowException

	self isCI ifTrue: [ self skip ].

	self should: [ IceGitClone new
				location: fixture location;
				url: 'git@github.com:doesNotExists/repo.git';
				execute ] raise: IceCloneRemoteNotFound