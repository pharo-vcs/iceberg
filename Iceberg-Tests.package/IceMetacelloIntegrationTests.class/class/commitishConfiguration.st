testing
commitishConfiguration

	^ IceTestParameter 
		withOptions: self commitishOptions
		on: self 
		selector: #commitishToUse

