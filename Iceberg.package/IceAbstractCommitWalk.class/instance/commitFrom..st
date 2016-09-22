private
commitFrom: result
	^ self repository frontend
			commitAt: (self commitIdFrom: result)
			ifAbsentPut: [ self repository class parseCommitInfo: result ]