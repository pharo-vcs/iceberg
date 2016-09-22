private
commitFrom: result
	^ self repository frontend
			commitAt: (self commitIdFrom: result)
			ifAbsentPut: [ IceMCGitRepository parseCommitInfo: result ]