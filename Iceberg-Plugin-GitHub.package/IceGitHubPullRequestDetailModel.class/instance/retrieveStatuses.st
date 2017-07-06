private
retrieveStatuses
	self statusPanel widget addMorphBack: 'Loading...' asMorph.
	[ 
	| status generalStatus statuses |
	
	[
		status := self pullRequest status.
		generalStatus := status at: 'state'.
		statuses := status at: 'statuses' ]
	on: Error do: [ :e | 
		generalStatus := 'Unknown'.
		statuses := #() ].
	
	UIManager default defer: [ 
		self statusPanel widget
			removeAllMorphs;
			addMorphBack: (self iconForStatus: generalStatus) asMorph;
			addMorphBack: generalStatus asMorph.
	 	self checksTable widget dataSource: (IceGitHubPullRequestDataSource elements: statuses) ]
	] fork