*Iceberg-Adapters
mcRepositoryFor: aLocationString
	| baseRepo |
	baseRepo := MCGitHubRepository location: aLocationString.

	(self icebergRepositoriesURLs includes: baseRepo scpUrl)
		ifTrue: [ 
			"Do not use Iceberg to load iceberg code, 
			see https://github.com/npasserini/iceberg/issues/168"
			^ baseRepo ]
		ifFalse: [  
			Transcript 
				show: 'Creating iceberg-metacello adapter for: ';
				show: aLocationString; cr.
			^ baseRepo getOrCreateIcebergRepository metacelloAdapter
		]
	