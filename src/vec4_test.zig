const testing = @import("std").testing;
const zlmath = @import("zlmath.zig");

const Vec4f = zlmath.Vec4f;

// ======== GLOBALS FOR TESTS ===========

const a = Vec4f.init(2.0, 4.0, 6.0, 8.0);
const b = Vec4f.init(3.0, 6.0, 9.0, 12.0);
const c = Vec4f.init(5.0, 3.0, 5.0, 9.0);

// ============ VEC4 TESTS ==============

test "vec4 add" {
    const result = a.add(b);
    
    try testing.expect(result.x == 5.0);
    try testing.expect(result.y == 10.0);
    try testing.expect(result.z == 15.0);
    try testing.expect(result.w == 20.0);
}

test "vec4 sub" {
    const result = a.sub(b);
    
    try testing.expect(result.x == -1.0);
    try testing.expect(result.y == -2.0);
    try testing.expect(result.z == -3.0);
    try testing.expect(result.w == -4.0);
}

test "vec4 mult" {
    const result = a.mult(b);
    
    try testing.expect(result == 180.0);
}

test "vec4 scale" {
    const factor = 2.0;
    const result = a.scale(factor);
    
    try testing.expect(result.x == 4.0);
    try testing.expect(result.y == 8.0);
    try testing.expect(result.z == 12.0);
    try testing.expect(result.w == 16.0);
}

test "vec4 len" {
    const result = a.len();
    try testing.expect(result == 10.95445115);
}

test "vec4 min" {
    const result = a.min(c);
    
    try testing.expect(result.x == 2.0);
    try testing.expect(result.y == 3.0);
    try testing.expect(result.z == 5.0);
    try testing.expect(result.w == 8.0);
}

test "vec4 max" {    
    const result = a.max(c);
    
    try testing.expect(result.x == 5.0);
    try testing.expect(result.y == 4.0);
    try testing.expect(result.z == 6.0);
    try testing.expect(result.w == 9.0);
}