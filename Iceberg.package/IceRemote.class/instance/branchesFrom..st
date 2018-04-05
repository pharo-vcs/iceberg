accesing
branchesFrom: aRepository
	"I return all the branches of my remote from a repository"

	^ aRepository branches
		select: [ :branch | branch isRemote and: [ branch remoteName = self name ] ]