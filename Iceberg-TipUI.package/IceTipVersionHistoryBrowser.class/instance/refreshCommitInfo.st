private
refreshCommitInfo
	infoTab contents: (selectedModel info ifNotNil: [ 
		(IceTipReadOnlyForm items: selectedModel info) buildWithSpec ])