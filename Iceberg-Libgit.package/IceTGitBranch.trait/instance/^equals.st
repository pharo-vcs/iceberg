comparing
= aBranch

	^ aBranch isBranch
		and: [ self repository = aBranch repository
				and: [ self fullname = aBranch fullname ] ]