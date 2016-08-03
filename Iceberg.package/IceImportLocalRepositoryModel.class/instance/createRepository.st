actions
createRepository
	self location ifNil: [ UIManager default
			abort: 'Please select a repository location'
			title: 'Could not create repository' ].

	[
		| repository |
		repository := IceRepository location: self location.
		subdirectory text ifNotNil: [ :text | repository subdirectory: text ].
		repository register.
			
		self window delete. 
	]
	on: IceError 
	do: [ :error | 
		UIManager default 
			abort: error messageText 
			title: 'Could not create repository' ]