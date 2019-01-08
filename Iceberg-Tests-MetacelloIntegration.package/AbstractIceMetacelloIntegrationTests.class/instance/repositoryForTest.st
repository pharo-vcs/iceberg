tests
repositoryForTest

	^ IceRepository registry detect: [ :e | e name = self repositoryName ]