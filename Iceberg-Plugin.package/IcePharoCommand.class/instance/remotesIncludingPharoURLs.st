private
remotesIncludingPharoURLs
	^ self remotes
		select: [ :each | self pharoURLs includes: each url ]