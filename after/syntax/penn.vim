if exists("b:current_syntax")
	if b:current_syntax == "penn"
		syntax clear
		let b:penn_tags_terminal = [
					\'QUOT',
					\'-LRB-',
					\'-RRB-',
					\'PU',
					\'ADJI',
					\'ADJN',
					\'ADV',
					\'AX',
					\'AXD',
					\'CL',
					\'CND',
					\'CONJ',
					\'D',
					\'FW',
					\'INTJ',
					\'MD',
					\'N',
					\'NEG',
					\'NPR',
					\'NUM',
					\'P',
					\'PASS',
					\'PNL',
					\'PRO',
					\'Q',
					\'Q+N',
					\'SCON',
					\'SYM',
					\'VB',
					\'VB0',
					\'VB2',
					\'WADV',
					\'WNUM',
					\'WD',
					\'WPRO']
		let b:penn_tags_nonterminal = [
					\'ADVP',
					\'CONJP',
					\'CP-EXL',
					\'CP-FINAL',
					\'CP-QUE',
					\'CP-THT',
					\'FRAG',
					\'FS',
					\'INTJP',
					\'IP-ADV',
					\'IP-EMB',
					\'IP-IMP',
					\'IP-SMC',
					\'IP-MAT',
					\'IP-REL',
					\'IP-SUB',
					\'NML',
					\'NP',
					\'NP-ADV',
					\'NP-LGS',
					\'NP-LOC',
					\'NP-MSR',
					\'NP-OB1',
					\'NP-OB2',
					\'NP-PRD',
					\'NP-RFL',
					\'NP-SBJ',
					\'NP-SBJ2',
					\'NP-TMP',
					\'NP-TPC',
					\'NP-VOC',
					\'NUMCLP',
					\'PNLP',
					\'PP',
					\'PRN',
					\'-HIGH',
					\'-LOW',
					\'CND',
					\'SCON',
					\'CONJ',
					\'CODE',
					\'LS',
					\'LST',
					\'ID',
					\'META']

		let b:penn_traces = [
					\'\*',
					\'\*が*\',
					\'\*を*\',
					\'\*に*\',
					\'\*で*\',
					\'\*によって*\',
					\'\*T\*',
					\'\*pro\*',
					\'\*exp\*',
					\'\*arb\*',
					\'\*speaker\*',
					\'\*speaker+pro\*',
					\'\*hearer\*',
					\'\*speaker+hearer\*']
		let b:penn_traces_in_tags = [
					\'\*',
					\'\*SBJ\*',
					\'\*OB1\*',
					\'\*OB2\*',
					\'\*ICH\*-1',
					\'\*ICH\*-2',
					\'\*ICH\*-3',
					\'\*ICH\*-4',
					\'\*ICH\*-5',
					\'\*ICH\*-6',
					\'\*ICH\*-7',
					\'\*ICH\*-8',
					\'\*ICH\*-9']
		call penn#syntax#_init()
	endif
endif
