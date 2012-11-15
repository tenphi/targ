targ = (args, scheme) ->
	if Object::toString.call(scheme) isnt '[object Object]'
		throw 'targ: wrong type'
	out = {}
	keys = Object.keys(scheme)
	i = 0
	j = 0
	lenKeys = keys.length
	while j < lenKeys && i < lenKeys
		arg = args[j]
		item = scheme[keys[i]]
		if !Array.isArray(item)
			item = [item]
		type = item[0]
		if typeof type isnt 'string'
			originalType = type
			type = type.name
		if (Object::toString.call(arg) is '[object ' + type + ']' or (Object::toString.call(arg) isnt '[object Function]' and Object::toString.call(originalType) is '[object Function]' and arg instanceof originalType))
			out[keys[i]] = arg
			i++
			j++
		else
			out[keys[i]] = item[1]
			i++
	return out

module.exports = targ