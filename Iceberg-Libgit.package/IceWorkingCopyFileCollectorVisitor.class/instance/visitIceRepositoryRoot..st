visiting
visitIceRepositoryRoot: anIceRootNode 
	
	^ anIceRootNode children flatCollect: [ :e | e accept: self ]