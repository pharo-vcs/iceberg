actions
reload
	IceTipReloadPackageAction new
		repository: self entity repository;
		package: self entity;
		execute