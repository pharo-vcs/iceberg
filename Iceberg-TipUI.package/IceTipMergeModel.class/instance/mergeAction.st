actions
mergeAction

	^ mergeAction ifNil: [
		mergeAction := IceMerge new
			repository: self repositoryModel entity;
			mergeCommit: commitish entity commit;
			yourself ]