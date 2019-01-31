private
refreshCommitTabPanel
	
	selectedModel ifNil: [ ^ self ].
	diffPage title: ('{1} to {2}' format: { 
		(self model commitModelAfter: selectedModel) 
			ifNotNil: #shortId
			ifNil: [ 'origin' ].
		selectedModel shortId }).
	commitPanel resetAllPageContents