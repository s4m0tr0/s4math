const testing = @import("std").testing;
const zlmath = @import("zlmath.zig");

const Vec2f = zlmath.Vec2f;

// ======== GLOBALS FOR TESTS ===========

const a = Vec2f.init(2.0, 4.0);
const b = Vec2f.init(3.0, 6.0);
const c = Vec2f.init(3.0, 3.0);

// ============ VEC2 TESTS ==============

test "vec2 add" {
    const result = a.add(b);
    
    try testing.expect(result.x == 5.0);
    try testing.expect(result.y == 10.0);
}

test "vec2 sub" {
    const result = a.sub(b);
    
    try testing.expect(result.x == -1.0);
    try testing.expect(result.y == -2.0);
}

test "vec2 mult" {
    const result = a.mult(b);
    
    try testing.expect(result == 30.0);
}

test "vec2 scale" {
    const factor = 2.0;
    const result = a.scale(factor);
    
    try testing.expect(result.x == 4.0);
    try testing.expect(result.y == 8.0);
}

test "vec2 len" {
    const result = a.len();
    try testing.expect(result == 4.472135955);
}

test "vec2 min" {
    const result = a.min(c);
    
    try testing.expect(result.x == 2.0);
    try testing.expect(result.y == 3.0);
}

test "vec2 max" {    
    const result = a.max(c);
    
    try testing.expect(result.x == 3.0);
    try testing.expect(result.y == 4.0);
}
