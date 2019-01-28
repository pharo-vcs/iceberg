private factory
newDiffPage

	^ NotebookPage 
		title: 'Diff'
		icon: (self iconNamed: #diff)
		provider: [ "It will be overriden" ]