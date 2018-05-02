API-accessing
logClass
	^ IceLog allSubclasses 
		detect: [ :each | each isAvailableFor: self ]