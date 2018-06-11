tests
testNewRepositoryPushToExplicitRemoteDoesNothing

	self shouldnt: [ self repository pushTo: (IceGitRemote url: 'git@github.com:pharo-vcs/testing.git') ] raise: Error