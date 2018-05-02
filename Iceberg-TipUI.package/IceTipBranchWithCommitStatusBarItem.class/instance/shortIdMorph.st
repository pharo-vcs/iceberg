factory
shortIdMorph
	^ (IceTipURLLabelMorph contents: model shortCommitId)
		setBalloonText: 'Copy the commit ID to the clipboard';
		onClick: [ self model copyCommitIDToClipboard ];
		yourself
	