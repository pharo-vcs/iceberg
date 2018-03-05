class initialization
initializeAnnouncements
	SystemAnnouncer uniqueInstance weak
		when: MCPackageModified 
		send: #mcPackageModified: 
		to: self