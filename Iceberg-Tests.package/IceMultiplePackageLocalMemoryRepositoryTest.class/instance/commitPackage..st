running
commitPackage: aPackageName
	
	^ (MCVersion 
		package: (MCPackage named: aPackageName)
		info: (MCVersionInfo
			name: aPackageName
			id: UUID new
			message: 'Initial commit'
			date: Date today
			time: Time now
			author: 'author'
			ancestors: #())
		snapshot: MCSnapshot empty).