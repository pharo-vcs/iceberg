accessing
workConfiguration
	^ workConfiguration ifNil: [ 
		workConfiguration := IceRepositoryWorkConfiguration for: self ]