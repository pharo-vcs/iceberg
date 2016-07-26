accessing
upstream
	^ upstream ifNil: [ self backend upstream ifNotNil: [:upstreamName |
		upstream := IceBranch new 
			name: upstreamName;
			repository: self repository;
			yourself
	]]