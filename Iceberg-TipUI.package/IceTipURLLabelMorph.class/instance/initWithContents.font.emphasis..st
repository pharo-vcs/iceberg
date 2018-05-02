initialization
initWithContents: aString font: aFont emphasis: textEmphasis
	super initWithContents: aString font: aFont emphasis: textEmphasis.
	self
		addEmphasis: TextEmphasis underlined;
		on: #click send: #execute to: self;
		on: #mouseEnter send: #mouseEnter: to: self;
		on: #mouseLeave send: #mouseLeave: to: self.
	