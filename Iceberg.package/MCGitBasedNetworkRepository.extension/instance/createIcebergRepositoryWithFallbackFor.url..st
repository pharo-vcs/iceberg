*Iceberg
createIcebergRepositoryWithFallbackFor: remote url: remoteUrl
	| urlToUse  |
	
	urlToUse := remoteUrl.
	[ ^ self createIcebergRepositoryFor: urlToUse ]
	on: IceAuthenticationError do: [ :e |
		self crLog: ('I got an error while cloning: {1}. I will try to clone the HTTPS variant.' format: { e messageText }). 
		urlToUse := remote httpsUrl.
		e retry ]