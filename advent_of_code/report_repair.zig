const std = @import("std");
const math = std.math;
const sort = std.sort;

const SUM = 2020;

fn compare(_: void, a: usize, b: usize) math.Order {
    return math.order(a, b);
}

fn lessThan(_: void, a: usize, b: usize) bool {
    return a < b;
}

pub fn reportRepair(input: []usize) usize {
    sort.sort(usize, input, {}, lessThan);
    return for (input) |x| {
        const y = SUM - x;
        if (sort.binarySearch(usize, y, input, {}, compare) != null) {
            break x * y;
        }
    } else 0;
}

pub fn reportRepairPartTwo(input: []usize) usize {
    sort.sort(usize, input, {}, lessThan);
    return loop: for (input) |x, i| {
        for (input[i + 1 ..]) |y| {
            const z = SUM - x -% y;
            if (sort.binarySearch(usize, z, input, {}, compare) != null) {
                break :loop x * y * z;
            }
        }
    } else 0;
}
