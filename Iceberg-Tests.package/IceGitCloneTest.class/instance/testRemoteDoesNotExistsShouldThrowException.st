tests
testRemoteDoesNotExistsShouldThrowException
	self should: [ IceGitClone new
				location: fixture location;
				url: 'git@github.com:doesNotExists/repo.git';
				clone ] raise: IceCloneRemoteNotFound