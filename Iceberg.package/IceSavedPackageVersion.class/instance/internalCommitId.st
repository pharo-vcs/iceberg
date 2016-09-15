printing
internalCommitId
	"This method is only for debugging purposes, in a real production environment there should not be 	any reason to keep us for computing a real commitId."

	^ [ self commitId first: 7 ]
		on: Error 
		do: [ updationCommit 
			ifNotNil: ['loaded from: ', updationCommit shortId ]
			ifNil: ['unknown']]