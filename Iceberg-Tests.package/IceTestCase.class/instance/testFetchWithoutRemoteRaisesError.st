tests-remotes
testFetchWithoutRemoteRaisesError

	self should: [ repository fetch ] raise: IceRemoteNotFoundError