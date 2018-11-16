private-changes
changesFromCommit: anIceCommit
	"Image changes should be taken into account before changes in the repository"
	^ (self modifiedPackages collect: [ :each | 
			IceImageChange package: each ]) asArray,
				(self referenceCommit changesFromCommit: anIceCommit) asArray