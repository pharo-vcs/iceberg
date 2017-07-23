accessing
mcRepository
	| baseRepo |
	
	baseRepo := MCGitHubRepository location: self location.
	^ baseRepo getOrCreateIcebergRepository metacelloAdapter