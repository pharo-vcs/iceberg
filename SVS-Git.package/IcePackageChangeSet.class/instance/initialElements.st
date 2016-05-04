initialization
initialElements
	^ (self patch operations groupedBy: #targetClass) 
		associations collect: [:assoc | 
			IceClassChangeSet class: assoc key operations: assoc value].
