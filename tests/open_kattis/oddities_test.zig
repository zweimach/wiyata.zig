const testing = @import("std").testing;

usingnamespace @import("wiyata").oddities;

test "open_kattis oddities" {
    const first_test = try oddities(testing.allocator, 10);
    defer testing.allocator.free(first_test);
    testing.expectEqualStrings("10 is even", first_test);

    const second_test = try oddities(testing.allocator, -5);
    defer testing.allocator.free(second_test);
    testing.expectEqualStrings("-5 is odd", second_test);
}
