private factory
newInfoPage

	^ NotebookPage 
		title: 'Info'
		icon: (self iconNamed: #smallQuestion)
		provider: [ self commitInfo ]