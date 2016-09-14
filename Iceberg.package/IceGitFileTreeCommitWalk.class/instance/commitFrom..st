private
commitFrom: result
	^ self repository frontend
			commitAt: ($| split: result) second
			ifAbsentPut: [ IceMCGitRepository parseCommitInfo: result ]