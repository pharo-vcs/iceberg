*Iceberg-TipUI
newOutline
	self flag: #todo. "This should be a spec component (but we don't have it for the moment)"
	^ IceTipOutlineMorph new
		changeProportionalLayout;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		asSpecAdapter