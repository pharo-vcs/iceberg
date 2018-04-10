API-packages
packages
	
	^ packageCache ifNil: [ 
		packageCache := self packageNames collect: [ :name | 
			IcePackage named: name repository: self repository ] ]