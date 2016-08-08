instance creation
from: myCommit to: theirsCommit
	^ self new 
		repository: myCommit repository;
		myVersion: myCommit;
		theirVersion: theirsCommit;
		yourself.