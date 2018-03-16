actions
unload
	<noCache>

	IceTipUnloadPackageAction new
		repository: self entity repository;
		package: self entity;
		execute