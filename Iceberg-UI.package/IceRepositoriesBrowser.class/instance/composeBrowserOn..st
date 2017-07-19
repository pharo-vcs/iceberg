building
composeBrowserOn: browser
	browser 
		row: #repositories; 
		row: #info.

	browser transmit 
		to: #repositories; 
		andShow: [ :presentation | 
			self composeRepositoriesIn: presentation ].
	browser transmit 
		from: #repositories; 
		to: #info; 
		andShow: [ :a |
			(a custom: GLMWrapper new)
				show: [ :wrapper | self composeRepositoryInfoIn: wrapper ];
				when: [ :model | model isValid ].
			(a custom: GLMWrapper new) 
				show: [ :wrapper | self composeNotValidIn: wrapper ];
				when: [ :model | model isValid not ] ].
		