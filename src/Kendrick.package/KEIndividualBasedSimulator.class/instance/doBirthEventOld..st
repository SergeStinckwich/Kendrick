as yet unclassified
doBirthEventOld: subPop
	|rand r p|
	rand := Random new.
	r := ((self eventRates at: (model getPID)) at: #empty ifAbsent: [ nil ]).
	r ifNotNil: [ 
		p := 1 - ((((r first) * step) negated) exp).
		(p > (rand next)) ifTrue: [ 
			|new stt|
			new := KEIndividual new.
			stt := ((eventList at: #empty) first toStatus).
			new currentStatus: stt.
			subPop graph newInd: new in: (subPop id).
			(subPop at: stt) addIndividual: 1.
			 ]
		 ]
	