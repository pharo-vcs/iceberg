comparing
= aBranch

	^ aBranch isRemote
		and: [ self name = aBranch name ]