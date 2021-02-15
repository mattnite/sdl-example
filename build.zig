const std = @import("std");
const Builder = @import("std").build.Builder;
const download = @import("download");
const SdlBuilder = @import("SdlBuilder");
const pkgs = @import("gyro").pkgs;

pub fn build(b: *Builder) !void {
    const mode = b.standardReleaseOptions();

    const link_type = b.option(SdlBuilder.LinkType, "link", "how you want to link to SDL2") orelse .static;

    var sdl = try SdlBuilder.init(b, link_type);
    defer sdl.deinit();

    const exe = b.addExecutable("sdl-example", "src/main.zig");
    exe.setBuildMode(mode);
    exe.addPackage(pkgs.SDL);
    sdl.link(exe);
    exe.install();

    const run_cmd = exe.run();
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}
