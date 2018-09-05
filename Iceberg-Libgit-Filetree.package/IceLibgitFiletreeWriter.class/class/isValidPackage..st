testing
isValidPackage: aFileReference
	^ (aFileReference basename endsWith: '.package') 
		and: [ aFileReference isDirectory 
			and: [(aFileReference / 'monticello.meta') exists]]