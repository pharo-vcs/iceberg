accessing
isMatching: anItem
	"I have to unwrap the FTBasicItem before comparing in the search"
	^ (dataSource toString: anItem data) beginsWith: pattern