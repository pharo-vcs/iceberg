*Iceberg-TipUI
newIceOutline
	self flag: #todo. "This should be a spec component (but we don't have it for the moment)"
	^ IceTipOutlineMorph new
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		asSpecAdapter