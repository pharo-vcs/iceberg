accessing
stubVersionInfo 
	^ stubVersionInfo ifNil: [ 
		stubVersionInfo := MCVersionInfo
			name: packageName
			id: UUID new
			message: 'fabricated from a proxy repository'
			date: nil
			time: nil
			author: ''
			ancestors: #() ]