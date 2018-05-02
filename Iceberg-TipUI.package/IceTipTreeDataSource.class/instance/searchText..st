accessing
searchText: aString
	"I use the search strategy specific for IceTip, as the elements are FTBasicItem and should be open"

	^ IceTipTreeSearchStrategy searchWith: aString dataSource: self