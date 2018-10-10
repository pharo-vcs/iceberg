testing
isChoiceBetween: firstOption and: secondOption

	^ (self optionA = firstOption)
		and: [ self optionB = secondOption ]