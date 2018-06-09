API-tags
removeTag: anIceTag 
	
	self handleLibgitError: [
		self repositoryHandle git_tag_delete: anIceTag name ]