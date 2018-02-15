private factory
newPanel
	^ PanelMorph new 
		changeTableLayout;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		yourself