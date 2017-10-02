private
lastCommitFound: aCommit
	| oldCommit |
	oldCommit := LastCommitFound.
	LastCommitFound := aCommit.
	"This is just a cleanup mechanism... in general iceberg will be scanning 
	 a full repository and each proxy will be pointing to same commit so no 
	 point in keep it waiting"
	(LastCommitFound notNil and: [ oldCommit isNil ]) ifTrue: [ 
		[ (Delay forSeconds: 60) wait. 
		 	LastCommitFound := nil ] fork ]