tests
testInstallingAMetacelloBaselineCreatesAnIcebergRepository

	self installBaseline.
	repository := IceRepository registry
		detect: [ :e | e name = 'pharo-git-test' ]
		ifNone: [ self fail ].