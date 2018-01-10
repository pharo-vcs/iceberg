accessing
detailedInfo

	| originInfo pullRemoteInfo pushRemoteInfo |
	originInfo := [self repository origin detailedInfo ]
		on: IceRemoteNotFoundError do: [ #() ].
	pullRemoteInfo := [ { 'Pulling from' -> (self repository pullRemote name) } ]
	 on: IceRemoteNotFoundError do: [ #() ].
	pushRemoteInfo := [ { 'Pushing to' -> (self repository pullRemote name) } ]
	 on: IceRemoteNotFoundError do: [ #() ].
	^ 	originInfo,
		{ 'Location' -> self repository location pathString },
		pullRemoteInfo,
		pushRemoteInfo,
		{ 'On branch' -> self repository description }