tests
testInstallingAMetacelloBaselineCreatesAnIcebergRepository

	"Avoid this test if on ssh on the CI"
	(self isTestingSSH and: [ self isCI ])
		ifTrue: [ ^ self skip ].

	self installBaseline