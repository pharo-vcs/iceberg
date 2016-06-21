private
loadSavedPackages
	^ savedPackages := (self allPackages collect: [ :pkg | pkg name -> 
		(IceSavedPackage new 
			package: pkg; 
			repository: self; 
			yourself) 
		]) asDictionary