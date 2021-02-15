# sdl-example

Code is the basic example from [SDL.zig](https://github.com/MasterQ32/SDL.zig). 
By default SDL is built locally and statically linked, you can specify different behaviour with `-Dlink=<link_type>`.
The possible values are `static`, `shared`, and `system`.

So if you'd rather use the system SDL library just:
```
gyro build -Dlink=system
```
