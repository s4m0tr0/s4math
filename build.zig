const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();

    const lib = b.addStaticLibrary("zlmath", "src/zlmath.zig");
    lib.setBuildMode(mode);
    lib.install();

    const vec2_tests = b.addTest("src/vec2_test.zig");
    const vec3_tests = b.addTest("src/vec3_test.zig");
    const vec4_tests = b.addTest("src/vec4_test.zig");
    const mat4_tests = b.addTest("src/mat4_test.zig");
    const quat_tests = b.addTest("src/quat_test.zig");
    
    vec2_tests.setBuildMode(mode);
    vec3_tests.setBuildMode(mode);
    vec4_tests.setBuildMode(mode);
    mat4_tests.setBuildMode(mode);
    quat_tests.setBuildMode(mode);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&vec2_tests.step);
    test_step.dependOn(&vec3_tests.step);
    test_step.dependOn(&vec4_tests.step);
    test_step.dependOn(&mat4_tests.step);
    test_step.dependOn(&quat_tests.step);
}
