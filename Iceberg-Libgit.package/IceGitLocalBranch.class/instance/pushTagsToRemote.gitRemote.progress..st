private-pushing
pushTagsToRemote: aRemote gitRemote: gitRemote progress: pushProgress

	self tags do: [ :tag | 
		self 
			pushTag: tag 
			toRemote: aRemote 
			gitRemote: gitRemote 
			progress: pushProgress ]