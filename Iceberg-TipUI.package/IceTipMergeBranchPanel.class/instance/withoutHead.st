accessing
withoutHead
	self branchesList widget dataSource elements: (self branchModels reject: #isHead).
	self branchesList widget selectFirstVisibleRow