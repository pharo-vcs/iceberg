baseline
commander: spec
	spec 
		baseline: 'Commander' 
		with: [ 
			spec 
				repository: 'github://dionisiydk/Commander:v0.4.1';
				loads: #('Core' 'AllActivators' 'Commander-SpecSupport') ]