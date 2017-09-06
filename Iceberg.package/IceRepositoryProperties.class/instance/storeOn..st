accessing
storeOn: aRepository
	(self fileFor: aRepository)
		ensureDelete;
		writeStreamDo: [ :stream | 
			STON 
				put: self properties 
				onStreamPretty: stream  ]