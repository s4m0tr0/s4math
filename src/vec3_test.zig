const testing = @import("std").testing;
const zlmath = @import("zlmath.zig");

const Vec3f = zlmath.Vec3f;

// ======== GLOBALS FOR TESTS ===========

const a = Vec3f.init(2.0, 4.0, 6.0);
const b = Vec3f.init(3.0, 6.0, 9.0);
const c = Vec3f.init(5.0, 3.0, 5.0);

// ============ VEC3 TESTS ==============

test "vec3 add" {
    const result = a.add(b);
    
    try testing.expect(result.x == 5.0);
    try testing.expect(result.y == 10.0);
    try testing.expect(result.z == 15.0);
}

test "vec3 sub" {
    const result = a.sub(b);
    
    try testing.expect(result.x == -1.0);
    try testing.expect(result.y == -2.0);
    try testing.expect(result.z == -3.0);
}

test "vec3 mult" {
    const result = a.mult(b);
    
    try testing.expect(result == 84.0);
}

test "vec3 scale" {
    const factor = 2.0;
    const result = a.scale(factor);
    
    try testing.expect(result.x == 4.0);
    try testing.expect(result.y == 8.0);
    try testing.expect(result.z == 12.0);
}

test "vec3 len" {
    const result = a.len();
    try testing.expect(result == 7.483314774);
}

test "vec3 min" {
    const result = a.min(c);
    
    try testing.expect(result.x == 2.0);
    try testing.expect(result.y == 3.0);
    try testing.expect(result.z == 5.0);
}

test "vec3 max" {    
    const result = a.max(c);
    
    try testing.expect(result.x == 5.0);
    try testing.expect(result.y == 4.0);
    try testing.expect(result.z == 6.0);
}