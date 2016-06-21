actions
createRepository
	[
		| repository |
		repository := IceRepository origin: remoteUrl text.
		subdirectory text ifNotNil: [ :text | repository subdirectory: text ].
		self location ifNotNil: [ :directory | repository directory: directory  ].
		repository register.
			
		self window delete. 
	]
	on: IceWrongUrl 
	do: [ UIManager default abort: 'The entered URL is not a valid scp repository URL.' ]