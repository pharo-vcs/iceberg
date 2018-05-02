factory
shortIdMorph
	^ (LabelMorph contents: model shortCommitId)
		addEmphasis: TextEmphasis underlined;
		on: #click send: #execute to: self;
		on: #mouseEnter send: #mouseEnter: to: self;
		on: #mouseLeave send: #mouseLeave: to: self;
		
		setBalloonText: 'Copy the commit ID to the clipboard';
		yourself
	