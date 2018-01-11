scenarios
scenarioForSwitchBranches
	"Create a new version of a package in another branch, then remove all code from the image."

	"1 - Commit a new version in a branch"
	repository checkoutPackageNamed: packageName.
	repository createBranch: 'forTestingCheckout'.
	self theTestClass compile: 'methodInBranch'.
	repository commitWithMessage: 'New method in branch'.

	"2 - Remove all code from the image"
	self removeTestPackages.
	self deny: (Smalltalk globals includesKey: #Test).	

	"3 - Reload package from master branch"
	repository checkoutBranch: 'master'.
