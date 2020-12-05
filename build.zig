const std = @import("std");
const Builder = std.build.Builder;

pub fn build(b: *Builder) void {
    const target = b.standardTargetOptions(.{});
    const mode = b.standardReleaseOptions();
    const lib = b.addStaticLibrary("wiyata", "src/main.zig");
    lib.setTarget(target);
    lib.setBuildMode(mode);
    lib.install();

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(b.getInstallStep());

    const unit_tests = b.addTest("tests/test.zig");
    unit_tests.addPackage(.{ .name = "wiyata", .path = "src/main.zig" });
    unit_tests.setBuildMode(.Debug);

    test_step.dependOn(&unit_tests.step);
}
