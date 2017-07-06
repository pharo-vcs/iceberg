private
retrieveStatuses
	self statusPanel widget addMorphBack: 'Loading...' asMorph.
	[ 
	| status generalStatus statuses |
	status := self pullRequest status.
	generalStatus := status at: 'state'.
	statuses := status at: 'statuses'.
	
	UIManager default defer: [ 
		self statusPanel widget
			removeAllMorphs;
			addMorphBack: generalStatus asStringMorph.
	 	self checksTable widget dataSource: (IceGitHubJSONDataSource elements: statuses) ]
	] fork