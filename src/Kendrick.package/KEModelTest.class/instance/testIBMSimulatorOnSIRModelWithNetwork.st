tests
testIBMSimulatorOnSIRModelWithNetwork
	|model|
	"model := self createSIRSimpleModel4: 'smallworld'."
	"model := self createSIRSimpleModel4: 'lattice'."
	model := self createSIRSimpleModel4: 'spatial'.
	"model := self createSIRSimpleModel4: 'random'."
	model run: 'IBM' from: 0.0 to: 1000 step: 0.1 algorithm: #DiscreteTime.
	model plot: #I.
	self assert: (model simulator data isDictionary) equals: true.
	self assert: (model simulator data size) equals: 3.
	