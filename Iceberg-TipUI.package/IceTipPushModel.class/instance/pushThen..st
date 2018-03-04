actions
pushThen: aBlock
	IceTipPushAction new
		repository: self entity;
		remote: self remote;
		onFinish: aBlock;
		execute
