baseline
libgit: spec
	spec 
		baseline: 'LibGit' 
		with: [ 
			spec
				repository: 'github://pharo-vcs/libgit2-pharo-bindings:v1.5.0';
  				loads: 'default' ].
	spec  
		project: 'LibGit-Tests'
		copyFrom: 'LibGit'
		with: [ spec loads: #('tests') ]