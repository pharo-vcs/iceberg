scenarios
scenarioOutgoingCommit
	"In this scenario we have one commit in local branch which is not pushed to the upstream."
	repository checkoutPackageNamed: packageName.
	self saveNewVersion.
