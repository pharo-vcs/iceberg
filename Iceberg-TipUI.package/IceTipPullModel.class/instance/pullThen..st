actions
pullThen: aBlock
	IceTipPullAction new
		repository: self entity;
		remote: self remote;
		onFinish: aBlock;
		execute