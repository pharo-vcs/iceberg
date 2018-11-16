tests
testNewRepositoryPushDoesNothing

	self shouldnt: [ self repository push ] raise: Error