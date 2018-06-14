refreshing
refresh
	self repository properties
		at: #format put: self fileFormat id;
		store.