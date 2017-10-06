baseline
libgit: spec
	spec 
		baseline: 'Libgit' 
		with: [ 
			spec
				repository: 'github://pharo-vcs/libgit2-pharo-bindings:v0.25.1';
  				loads: 'default' ].
	spec  
		project: 'Libgit-Tests'
		copyFrom: 'Libgit'
		with: [ spec loads: #('tests') ]