running
setUp
	git := Git new origin: self origin.
	self removeTestDirectory.
	self removeTestPackage.
