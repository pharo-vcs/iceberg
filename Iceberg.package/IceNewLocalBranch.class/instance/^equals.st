comparing
= aBranch

	^ aBranch isLocal
		and: [ self name = aBranch name ]