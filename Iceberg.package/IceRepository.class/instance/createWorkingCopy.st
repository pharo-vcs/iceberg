initialization
createWorkingCopy
	
	| newWorkingCopy packagesInDisk |
	self halt.
	newWorkingCopy := IceWorkingCopy repository: self.
	packagesInDisk := self lookupPackagesInDisk.
	newWorkingCopy addPackages: packagesInDisk.
	self workingCopy: newWorkingCopy