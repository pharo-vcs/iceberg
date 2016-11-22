baseline
baseline: spec
	<baseline>
	spec for: #common do: [ spec
		baseline: 'FileTree' with: [ spec
			repository: 'github://npasserini/filetree:pharo6.0_dev/repository';
			loads: 'Git' ];
		baseline: 'LibGit' with: [ spec 
			repository: 'github://npasserini/libgit2-pharo-bindings:development';
  			loads: 'default' ];
		baseline: 'LibGit-Tests' with: [ spec 
			repository: 'github://npasserini/libgit2-pharo-bindings:development';
  			loads: 'tests' ];
		package: 'Iceberg'
			with: [ spec requires: #(FileTree LibGit) ];
		package: 'Iceberg-Tests'
			with: [ spec requires: #(default 'Libgit-Tests') ];
		group: 'default'
			with: #(Iceberg);
		group: 'development'
			with: #(default 'Iceberg-Tests')
	]