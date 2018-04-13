tests
testInstallingAMetacelloBaselineCreatesAnIcebergRepository

	(Iceberg remoteTypeSelector = #scpUrl
		and: [ self isCI ]) ifTrue: [ ^ self skip ].

	repository := IceRepository registry
		detect: [ :e | e name = 'pharo-git-test' ]
		ifNone: [ self fail ].