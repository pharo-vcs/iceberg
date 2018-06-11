accessing
tagModels
	
	^ self entity tags 
		collect: [ :each | 
			(IceTipTagModel 
				repositoryModel: self 
				on: each) 
				beCached ]