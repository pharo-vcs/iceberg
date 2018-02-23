as yet unclassified
calculateAllElements
	self elements do: [ :each | each calculateAllElements ]