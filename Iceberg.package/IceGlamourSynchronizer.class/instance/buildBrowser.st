building
buildBrowser
	| browser |
	browser := GLMCompositePresentation new
		title: self title;
		custom: IceGlamourCommitBrowser new.
		
	self buildUpdateBrowserOn: browser.
	self buildPushBrowserOn: browser.
		
	^ browser