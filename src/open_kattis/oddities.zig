const std = @import("std");
const fmt = std.fmt;
const mem = std.mem;

pub fn oddities(allocator: *mem.Allocator, x: isize) ![]u8 {
    const odd_or_even = if (@mod(x, 2) == 0) "even" else "odd";
    return fmt.allocPrint(allocator, "{d} is {s}", .{ x, odd_or_even });
}
