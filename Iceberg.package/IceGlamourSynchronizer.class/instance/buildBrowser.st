building
buildBrowser
	| browser |
	browser := GLMCompositePresentation new
		title: self title.
		
	self buildCommitBrowserOn: browser.
	self buildUpdateBrowserOn: browser.
	self buildPushBrowserOn: browser.
		
	^ browser