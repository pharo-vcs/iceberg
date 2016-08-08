private
loadVersionsInBranch: branch
	^ self repository backend lookupVersionsOfPackage: self inBranch: branch committish
