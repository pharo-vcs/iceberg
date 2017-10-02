private
stubVersionInfo 
	^ stub ifNil: [ 
		stub := MCVersionInfo
			name: packageName
			id: UUID new
			message: 'fabricated from a proxy repository'
			date: nil
			time: nil
			author: ''
			ancestors: #() ]