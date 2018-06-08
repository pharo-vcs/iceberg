API-tags
tags
	
	^ tagDictionary keys collect: [ :k | IceTag named: k inRepository: self ]