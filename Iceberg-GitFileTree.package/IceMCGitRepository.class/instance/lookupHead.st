private
lookupHead
	^ [ IceBranch named: self currentBranch inRepository: self frontend ]
		on: IceNoCurrentBranch
		do: [ [ IceTag named: self currentTag inRepository: self frontend ] 
			on: MCFileTreeGitError 
			do: [ self frontend commitAt: (self currentCommitId) ] ]