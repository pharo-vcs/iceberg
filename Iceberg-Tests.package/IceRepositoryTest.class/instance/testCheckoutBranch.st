tests - branches
testCheckoutBranch
	"Prepare"
	self scenarioForSwitchBranches.

	repository loadPackage: packageName.
	self assert: repository branch name equals: 'master'.
	self deny: (self theTestClass canUnderstand: #methodInBranch).
	
	"Exercise"
	repository checkoutBranch: 'forTestingCheckout'.

	"Assert"
	self assert: repository branch name equals: 'forTestingCheckout'.
	self assert: (self theTestClass canUnderstand: #methodInBranch).
