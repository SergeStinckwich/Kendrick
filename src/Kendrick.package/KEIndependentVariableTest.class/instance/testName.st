as yet unclassified
testName
	| t v |
	t := FMTower new.
	t metamodel addSmalltalkClasses: (Array with:KEVariable with:KEIndependentVariable with: KESimpleExpression with: KEExpression with:KEOperator).
	v := (t metamodel elementNamed: 'KE.IndependentVariable') createInstance.
	v name: 'v'.
	self assert: v name equals: 'v'