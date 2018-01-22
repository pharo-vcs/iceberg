private
obtainAvailableBranchNames
	^ ((self repository allBranches 
		collect: #shortname as: Set)
		addAll: self baseBranchNames;
		asArray)
		sort.
	