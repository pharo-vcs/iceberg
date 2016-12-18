scripting opening
openWith: aRenderer
	^ (super openWith: aRenderer)
		extent: self class defaultExtent;
		yourself