initialization
newStatusPanel
	^ PanelMorph new 
		color: Color transparent;
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		asSpecAdapter