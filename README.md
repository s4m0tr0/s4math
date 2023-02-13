# s4math 

Linear Math library in ⚡Zig⚡

### Overview

This library is a port of linmath.h.

Since I'm in the process of learning game development, this project was ported for the usage in my personal projects, so if you're willing to use this code please take it with a grain of salt.

### Building

Clone the repo and do the following:

```sh
cd s4math
zig build
```

### Example

```cpp
const std = @import("std");
const s4math = @import("s4math.zig");

const Vec3f = s4math.Vec3f;

pub fn main() !void {
    const a = Vec3f.init(2.0, 4.5, 6.5);
    const b = Vec3f.init(3.5, 6.0, 9.0);
    const c = a.add(b);
    std.debug.print("Vec3f(x:{d}, y:{d}, z:{d})\n", .{v.x, v.y, v.z});
}

// Output:
// info: Vec3f(x:5.5, y:10.5, z:15.5)
```

### License

This project is free software; you can redistribute it and/or modify it under the terms of the MIT license. See LICENSE for details.