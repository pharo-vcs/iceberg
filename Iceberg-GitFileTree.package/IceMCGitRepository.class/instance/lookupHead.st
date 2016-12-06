private
lookupHead
	^ [ IceLocalBranch named: self currentBranch inRepository: self frontend ]
		on: MCFileTreeGitError
		do: [ [ IceTag named: self currentTag inRepository: self frontend ] 
			on: MCFileTreeGitError 
			do: [ self frontend commitAt: (self currentCommitId) ] ]