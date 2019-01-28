private
refreshCommitTabPanel
	
	selectedModel ifNil: [ ^ self ].
	commitPanel resetAllPageContents