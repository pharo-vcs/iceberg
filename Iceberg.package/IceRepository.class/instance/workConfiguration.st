accessing work
workConfiguration
	^ workConfiguration ifNil: [ 
		workConfiguration := IceRepositoryWorkConfiguration for: self ]