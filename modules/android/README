# CrashTestDummy Module

## Description

A utility to test different types of crash and exception events. 

## Accessing the CrashTestDummy Module

To access this module from JavaScript, you would do the following:

	var CrashTestDummy = require("ti.crashtestdummy");

The CrashTestDummy variable is a reference to the Module object.	

## Reference

### `throwException`

Javascript-triggered native exception.

**Args**

none

**Usage**

```
var ctd = require('ti.crashtestdummy');
ctd.throwException();
```

### `fireInMainThreadUsingTitanium`

Javascript-triggered native exception on main thread. This is to invoke another method in the main thread within Titanium's structure.

**Args**

- `string` - The first argument is the name of the method to call.

**Usage**

```
var ctd = require('ti.crashtestdummy');
ctd.fireInMainThreadUsingTitanium('throwException');
```

### `fireInBackgroundThreadUsingNative`

Javascript-triggered native exception on background thread. This is to invoke another method in the main thread within Titanium's structure.

**Args**

- `string` - The first argument is the name of the method to call.

**Usage**

```
var ctd = require('ti.crashtestdummy');
ctd.fireInBackgroundThreadUsingNative('throwException');
```

### `fireInMainThreadUsingNative`

Uncaught native exception.

This is to invoke another method in the main thread within Titanium's structure. 

**Args**

- `string` - The first argument is the name of the method to call.
 
**Usage**

```
var ctd = require('ti.crashtestdummy');
ctd.fireInMainThreadUsingNative('throwException');
```

### `accessBadMemory`

This is to create a hard crash, by way of a segfault when we dereference a bad pointer.

**Args**

none

**Usage**

```
var ctd = require('ti.crashtestdummy');
ctd.accessBadMemory();
```

### `deadlock`

Deadlock in javascript. This is to lock twice, never recovering.

**Args**

none

**Usage**

```
var ctd = require('ti.crashtestdummy');
ctd.deadlock();
```

### `infiniteLoop`

This is to infinite loop, never recovering.
 
**Args**

none
  
**Usage**

```
var ctd = require('ti.crashtestdummy');
ctd.infiniteLoop();
```
 
### `consumeMemory`

Memory bloat.

This is to quickly leak memory, as we enter an infinite loop to fill storage. This is to spur a memory panic and then force kill from the OS.

**Args**

none
 
**Usage**

```
 var ctd = require('ti.crashtestdummy');
 ctd.consumeMemory();
```

### `fireInMainThreadUsingNative`

OS-triggered kill in foreground

This is to invoke another method in the main thread within Titanium's structure.

**Args**

- `string` - The first argument is the name of the method to call.
  
**Usage**

```
var ctd = require('ti.crashtestdummy');
ctd.fireInMainThreadUsingNative('deadlock');
```

### `fireInBackgroundThreadUsingNative`

OS-triggered kill entering background. 

This is to invoke another method in the main thread within Titanium's structure. 

**Args**

- `string` - The first argument is the name of the method to call.
 
**Usage**

```
var ctd = require('ti.crashtestdummy');
ctd.fireInBackgroundThreadUsingNative('deadlock');
```

### `fireInMainThreadUsingTitanium`

This is to invoke another method in the main thread within Titanium's structure.

**Args**

- `string` - The first argument is the name of the method to call.
 
**Usage**

```
var ctd = require('ti.crashtestdummy');
ctd.fireInMainThreadUsingTitanium('throwException');
```

### `overReleaseMemory`

This is to create a hard crash, by way of a segfault when we overrelease memory.

**Args**

none
 
**Usage**

```
var ctd = require('ti.crashtestdummy');
ctd.overReleaseMemory();
```

### `addToStorage`

This is to slowly leak memory, as storage never stops holding onto its contents.

**Args**

- `string` - Text to persist
 
**Usage**

```
 var ctd = require('ti.crashtestdummy');
 ctd.addToStorage("Store me!");
```

## Author

- Blain Hamon (https://github.com/BlainHamon)[https://github.com/BlainHamon]
- TZ Martin (http://twitter.com/tzmartin)[http://twitter.com/tzmartin]

## License

The MIT License (MIT)
Copyright © 2016 TZ Martin, http://tzmartin.github.io <license@tzmartin.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the “Software”), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.