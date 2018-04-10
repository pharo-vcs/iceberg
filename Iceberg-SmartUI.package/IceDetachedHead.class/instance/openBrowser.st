browsing
openBrowser
	
	| spec |
	spec := IceSmartDetachedHeadSpecModel basicNew
		model: self;
		initialize;
		yourself.
	spec openWithSpecLayout: spec defaultSpec.