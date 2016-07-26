accessing
upstream
	^ upstream ifNil: [ self backend upstream ifNotNil: [:upstreamName |
		upstream := (IceBranch named: upstreamName inRepository: self)
	]]