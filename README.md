## Typed-based handling for missed function arguments

### Simple handling

```coffee
targ = require 'targ'

func = () ->
	{str, num, bool, callback} = targ arguments,
		str: String,
		num: Number,
		bool: Boolean,
		callback: Function
	console.log str, num, bool, callback

func 'text', 123, true, (->) # 'text', 123, true, function() {}
func 123, (->) # undefined, 123, undefined, function() {}
func 'text', true # 'text', undefined, true, undefined
```

### Handling with defaults

```coffee
targ = require 'targ'

func = () ->
	{str, num, bool, callback} = targ arguments,
		str: [String, 'missed'],
		num: [Number, 0],
		bool: [Boolean, false],
		callback: [Function, (->)]
	console.log str, num, bool, callback

func 'text', 123, true, (->) # 'text', 123, true, function() {}
func 123, (->) # 'missed', 123, false, function() {}
func 'text', true # 'text', 0, true, function() {}
```

### Custom Classes

```coffee
targ = require 'targ'
Type = (->)

func = () ->
	{obj, callback} = targ arguments,
		obj: Type
		callback: Function
	console.log obj, callback

obj = new Type
obj.prop = 'value'
func obj, (->) # { prop: 'value' }, function() {}
func {} # undefined, undefined
```

## (The MIT License)

Copyright (c) 2009-2011 TJ Holowaychuk <tj@vision-media.ca>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.