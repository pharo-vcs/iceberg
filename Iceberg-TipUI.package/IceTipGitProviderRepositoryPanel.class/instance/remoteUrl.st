accessing
remoteUrl
	
	| builder |
	builder := IceUrlBuilder new
		protocol: self selectedProtocol new;
		username: self userName project: self projectName.
	self configureBuilder: builder.
	^ builder buildUrl