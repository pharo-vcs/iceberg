utilities
forgetRepository: repository updating: presentation
	(self uiManager
		confirm:
			('Are you sure to remove repository: {1}?
(Packages will not be deleted, nor the repository from the file system)'
				format: { repository origin url })
		label: 'Removing Iceberg Repository'
	)
	ifTrue: [ 
		repository forget.
		presentation update 
	]