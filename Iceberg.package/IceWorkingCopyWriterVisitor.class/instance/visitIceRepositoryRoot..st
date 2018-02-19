visiting
visitIceRepositoryRoot: anIceRootNode 
	
	anIceRootNode children do: [ :c | c accept: self ]