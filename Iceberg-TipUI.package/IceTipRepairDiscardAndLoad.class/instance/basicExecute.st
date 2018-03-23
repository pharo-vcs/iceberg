executing
basicExecute
	UIManager default 
		informUser: 'Reloading packages from repository version' 
		during: [  
			Iceberg announcer suspendAllWhile: [
				self repository packages
					select: #isLoaded
					thenDo: #reload ] ]