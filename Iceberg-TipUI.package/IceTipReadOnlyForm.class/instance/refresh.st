private
refresh
	widgets removeAll.
	self layout: self newLayout.
	self layout	
		newColumn: [ :column | self addWidgetsTo: column ]