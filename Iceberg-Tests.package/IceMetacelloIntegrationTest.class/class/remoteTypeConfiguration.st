configurations
remoteTypeConfiguration
	^ IceTestParameter 
		withOptions: { #httpsUrl. #scpUrl }
		on: Iceberg 
		selector: #remoteTypeSelector