actions
previewMerge: aMergeType
	"this will open a 'checkout browser' that will allow user to validate the changes before 
	 actually checking out (checkout operation will be called in my sibling method, #checkout)"
	<noCache>
	(IceTipMergePreviewBrowser onBranch: self) 
		mergeType: aMergeType;
		openWithSpec