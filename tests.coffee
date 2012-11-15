targ = require './targ'

module.exports =
	simple: (test) ->
		func = (->)
		do (arg1 = 'string', arg2 = true, arg3 = func) ->
			args = targ arguments,
				str: String
				bool: Boolean
				func: Function
			test.deepEqual args,
				str: 'string'
				bool: true
				func: func
		do (arg1 = undefined, arg2 = undefined, arg3 = undefined) ->
			args = targ arguments,
				str: [String, '']
				bool: [Boolean, false]
				func: [Function, func]
			test.deepEqual args,
				str: ''
				bool: false
				func: func
		test.done();
	missingParam: (test) ->
		func = (->)
		do (arg1 = 'string', arg2 = func) ->
			args = targ arguments,
				str: String
				obj: Object
				func: Function
			test.deepEqual args,
				str: 'string'
				obj: undefined
				func: func
		test.done();
	extraParam: (test) ->
		# it's case of abnormal situation
		func = (->)
		do (arg1 = 'string', arg2 = true, arg3 = false, arg4 = func) ->
			args = targ arguments,
				str: String
				bool: Boolean
				func: Function
			test.deepEqual args,
				str: 'string'
				bool: true
				func: undefined
		test.done();
	customClass: (test) ->
		func = (->)
		Type = (->)
		obj = new Type
		do (arg1 = obj, arg2 = func) ->
			args = targ arguments,
				obj: Type
				func: Function
			test.deepEqual args,
				obj: obj
				func: func
		do (arg1 = {}, arg2 = undefined) ->
			args = targ arguments,
				obj: Type
				func: Function
			test.deepEqual args,
				obj: undefined
				func: undefined
		test.done();