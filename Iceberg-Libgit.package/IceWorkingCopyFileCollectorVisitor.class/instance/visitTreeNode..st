visiting
visitTreeNode: anIceNode 

	self withNode: anIceNode do: [ 
		^ anIceNode value definition accept: self ]