private factory
newDiffPage

	^ NotebookPage 
		title: 'Diff'
		icon: (self iconNamed: #diff)
		provider: [ self diff ]