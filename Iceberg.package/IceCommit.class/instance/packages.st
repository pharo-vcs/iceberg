packages
packages
	
	^ packageCache ifNil: [ 
		packageCache := self packageNames collect: [ :name | 
			IceSavedPackage named: name repository: self repository ] ]