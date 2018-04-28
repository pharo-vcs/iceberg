tests
testLocationAlreadyExistsThrowsException
	
	| action |
	
	fixture ensureRemoteRepository.	
	fixture location resolve ensureCreateDirectory.
	
	action := IceGitClone new
				location: fixture location;
				url: fixture factory defaultRemoteUrl;
				yourself. 
				
	self should: [ action execute ] raise: IceCloneLocationAlreadyExists