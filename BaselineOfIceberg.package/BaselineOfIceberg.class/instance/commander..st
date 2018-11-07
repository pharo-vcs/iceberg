baseline
commander: spec
	spec 
		baseline: 'Commander' 
		with: [ 
			spec 
				repository: 'github://pharo-ide/Commander:v0.7.1';
				loads: #('Core' 'AllActivators' 'Commander-SpecSupport') ]