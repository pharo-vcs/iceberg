selection
selectAll
	self elements
		do: [ :each | selectedItems add: each ].
	self tableRefresh