visiting
visitIceRepositoryRoot: anIceRootNode 
	
	anIceRootNode children do: [ :each | each accept: self ]