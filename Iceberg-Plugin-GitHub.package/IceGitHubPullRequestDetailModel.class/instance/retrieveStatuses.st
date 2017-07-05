initialization
retrieveStatuses
	[ 
	| status generalStatus statuses |
	status := self pullRequest status.
	generalStatus := status at: 'state'.
	statuses := status at: 'statuses'.
	
	UIManager default defer: [ 
		self statusPanel widget 
			addMorphBack: (generalStatus asMorph
				hResizing: #spaceFill;
				vResizing: #spaceFill;
				yourself).
	 	self checksTable widget dataSource: (IceGitHubJSONDataSource elements: statuses) ]
	] fork