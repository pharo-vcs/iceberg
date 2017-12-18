tests
testNotLoadedStatusSendsCheckoutToRepository

	| status aCommitish message |
	aCommitish := Object new.
	
	status := IceNotLoaded on: repository.
	status checkoutCommitish: aCommitish loading: IceAllPackagesLoader new.
	
	message := repository popMessage.
	self assert: message selector equals: #checkoutCommitish:.
	self assert: message arguments first equals: aCommitish.