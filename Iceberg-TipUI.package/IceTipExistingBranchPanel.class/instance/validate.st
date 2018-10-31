accessing
validate
	self selectedBranch ifNil: [ IceError signal: 'Please select a branch to checkout.' ]