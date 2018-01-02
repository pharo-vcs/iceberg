accessing
upstream
	^ upstream ifNil: [ 
		self backend upstream 
			ifNotNil: [ :upstreamName |
				upstream := (IceOldRemoteBranch named: upstreamName inRepository: self repository) ] ]