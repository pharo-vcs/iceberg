accessing
packageForCategoryNamed: categoryName
	"Is this the best way to find an mcPackage out of a category name?"
	MCWorkingCopy managersForCategory: categoryName do: [ :ws | ^ ws package ].
	^ nil.