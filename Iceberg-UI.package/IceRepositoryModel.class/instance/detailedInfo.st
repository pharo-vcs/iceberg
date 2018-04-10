accessing
detailedInfo

	| originInfo pullRemoteInfo pushRemoteInfo |
	originInfo := [self repository origin detailedInfo ]
		on: IceRemoteNotFoundError do: [ #() ].
	pullRemoteInfo := [ { 'Pulling from' -> (self repository upstream name) } ]
	 on: IceRemoteNotFoundError do: [ #() ].
	pushRemoteInfo := [ { 'Pushing to' -> (self repository upstream name) } ]
	 on: IceRemoteNotFoundError do: [ #() ].
	^ 	(originInfo,
		{ 'Location' -> self repository location pathString },
		pullRemoteInfo,
		pushRemoteInfo,
		{ 'On branch' -> self repository description })
		collect: [ :each | 
			(each key, ':') -> each value ]