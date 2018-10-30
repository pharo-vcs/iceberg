building
compose
	self tabulator with: [ :browser |
		browser initialExtent: self initialExtent.
		self composeBrowserOn: browser ]