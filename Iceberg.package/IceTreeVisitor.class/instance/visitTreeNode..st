visiting
visitTreeNode: anIceNode
	
	self withNode: anIceNode do: [ 
		anIceNode value accept: self ]