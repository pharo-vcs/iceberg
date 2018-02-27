actions
calculateAllElements
	self elements do: [ :each | each calculateAllElements ]