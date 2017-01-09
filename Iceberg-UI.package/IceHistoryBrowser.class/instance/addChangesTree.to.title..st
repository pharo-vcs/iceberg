building
addChangesTree: transform to: presentation title: paneTitle
	presentation aPane: transform.

	presentation transmit
		transformed: transform;
		to: transform;
		andShow: [ :tab | tab 
			title: paneTitle;
			custom: IceGlamourChangesTree new ].

	presentation transmit from: transform; toOutsidePort: #selection.