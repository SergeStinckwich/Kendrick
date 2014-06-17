as yet unclassified
solve
	|timeSeries t countStep |
	timeSeries := OrderedCollection new.
	self initializeResult.
	t := tMin.
	countStep := 0.
	[ t < tMax ] whileTrue: [ 
		model addTemporalParameter: #t value: t.
		self doTauLeapIteration.
		t := t + step.
		countStep := countStep + 1.
		self updateResult.
		timeSeries add: t. 
		"check if extinction occurs"
		(model population getNbIndividualsOfCompartment: #I) <= 0 ifTrue: [ 
			self prepareData: timeSeries.
			^ countStep
			 ]
	 ].
	self prepareData: timeSeries.
	^ countStep
	
	
	