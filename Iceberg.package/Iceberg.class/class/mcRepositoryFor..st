*Iceberg-Adapters
mcRepositoryFor: aLocationString
	Transcript show: 'Creating iceberg-metacello adapter for: ', aLocationString; cr.
	^ (MCGitHubRepository location: aLocationString) getOrCreateIcebergRepository metacelloAdapter