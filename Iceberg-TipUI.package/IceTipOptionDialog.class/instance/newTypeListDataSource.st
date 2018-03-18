private factory
newTypeListDataSource
	^ IceTipDataSource new 
		tool: self;
		elements: self allTypes;
		yourself.
		
	"^ IceTipTreeOutlineDataSource new 
		tool: self;
		rootForItems: self allTypes;
		childrenBlock: [ :each | #() ];
		format: [ :each | each title ];
		icon: [ :each | each icon ];
		yourself"