const std = @import("std");

fn Vec2(comptime T: type) type {
    return struct {
        x: T,
        y: T,

        const Self = @This();
        pub fn init(x: T, y: T) Self {
            return Self {
                .x = x,
                .y = y
            };
        }

        pub fn add(self: Self, rhs: Self) Self {
            return Self {
                .x = self.x + rhs.x,
                .y = self.y + rhs.y
            };
        }

        pub fn sub(self: Self, rhs: Self) Self {
            return Self {
                .x = self.x - rhs.x,
                .y = self.y - rhs.y
            };
        }

        pub fn scale(self: Self, k: T) Self {
            return Self {
                .x = self.x * k,
                .y = self.y * k
            };
        }

        pub fn mult(self: Self, rhs: Self) T {
            return (
                (rhs.x * self.x) + (rhs.y * self.y)
            );
        }

        pub fn len(self: Self) T {
            return std.math.sqrt(self.mult(self));
        }

        pub fn min(self: Self, rhs: Self) Self {
            return Self {
                .x = std.math.min(self.x, rhs.x),
                .y = std.math.min(self.y, rhs.y)
            };
        }

        pub fn max(self: Self, rhs: Self) Self {
            return Self {
                .x = std.math.max(self.x, rhs.x),
                .y = std.math.max(self.y, rhs.y)
            };
        }
    };
}

fn Vec3(comptime T: type) type {
    return struct {
        x: T,
        y: T,
        z: T,

        const Self = @This();
        pub fn init(x: T, y: T, z: T) Self {
            return Self {
                .x = x,
                .y = y,
                .z = z
            };
        }

        pub fn add(self: Self, rhs: Self) Self {
            return Self {
                .x = self.x + rhs.x,
                .y = self.y + rhs.y,
                .z = self.z + rhs.z
            };
        }

        pub fn sub(self: Self, rhs: Self) Self {
            return Self {
                .x = self.x - rhs.x,
                .y = self.y - rhs.y,
                .z = self.z - rhs.z
            };
        }

        pub fn scale(self: Self, k: T) Self {
            return Self {
                .x = self.x * k,
                .y = self.y * k,
                .z = self.z * k
            };
        }

        pub fn mult(self: Self, rhs: Self) T {
            return (
                (rhs.x * self.x) + 
                (rhs.y * self.y) + 
                (rhs.z * self.z)
            );
        }

        pub fn len(self: Self) T {
            return std.math.sqrt(self.mult(self));
        }

        pub fn min(self: Self, rhs: Self) Self {
            return Self {
                .x = std.math.min(self.x, rhs.x),
                .y = std.math.min(self.y, rhs.y),
                .z = std.math.min(self.z, rhs.z),
            };
        }

        pub fn max(self: Self, rhs: Self) Self {
            return Self {
                .x = std.math.max(self.x, rhs.x),
                .y = std.math.max(self.y, rhs.y),
                .z = std.math.max(self.z, rhs.z)
            };
        }

        pub fn mult_cross(self: Self, rhs: Self) Self {
            return Self {
                .x = self.y * rhs.z - self.z * rhs.y,
                .y = self.z * rhs.x - self.x * rhs.z,
                .z = self.x * rhs.y - self.y * rhs.x
            };
        }

        pub fn reflect(self: Self, rhs: Self) Self {
            var p: T = 2 * self.mult(rhs);
            return Self {
                .x = self.x - (p * rhs.x),
                .y = self.y - (p * rhs.y),
                .z = self.z - (p * rhs.z)
            };
        }
    };
}

fn Vec4(comptime T: type) type {
    return struct {
        x: T,
        y: T,
        z: T,
        w: T,

        const Self = @This();
        pub fn init(x: T, y: T, z: T, w: T) Self {
            return Self {
                .x = x,
                .y = y,
                .z = z,
                .w = w
            };
        }

        pub fn add(self: Self, rhs: Self) Self {
            return Self {
                .x = self.x + rhs.x,
                .y = self.y + rhs.y,
                .z = self.z + rhs.z,
                .w = self.w + rhs.w
            };
        }

        pub fn sub(self: Self, rhs: Self) Self {
            return Self {
                .x = self.x - rhs.x,
                .y = self.y - rhs.y,
                .z = self.z - rhs.z,
                .w = self.w - rhs.w
            };
        }

        pub fn scale(self: Self, k: T) Self {
            return Self {
                .x = self.x * k,
                .y = self.y * k,
                .z = self.z * k,
                .w = self.w * k
            };
        }

        pub fn mult(self: Self, rhs: Self) T {
            return (
                (rhs.x * self.x) + 
                (rhs.y * self.y) + 
                (rhs.z * self.z) + 
                (rhs.w * self.w)
            );
        }

        pub fn len(self: Self) T {
            return std.math.sqrt(self.mult(self));
        }

        pub fn min(self: Self, rhs: Self) Self {
            return Self {
                .x = std.math.min(self.x, rhs.x),
                .y = std.math.min(self.y, rhs.y),
                .z = std.math.min(self.z, rhs.z),
                .w = std.math.min(self.w, rhs.w)
            };
        }

        pub fn max(self: Self, rhs: Self) Self {
            return Self {
                .x = std.math.max(self.x, rhs.x),
                .y = std.math.max(self.y, rhs.y),
                .z = std.math.max(self.z, rhs.z),
                .w = std.math.max(self.w, rhs.w)
            };
        }

        pub fn mult_cross(self: Self, rhs: Self) Self {
            return Self {
                .x = self.y * rhs.z - self.z * rhs.y,
                .y = self.z * rhs.x - self.x * rhs.z,
                .z = self.x * rhs.y - self.y * rhs.x,
                .w = 1
            };
        }

        pub fn reflect(self: Self, rhs: Self) Self {
            var p: T = 2 * self.mult(rhs);
            return Self {
                .x = self.x - (p * rhs.x),
                .y = self.y - (p * rhs.y),
                .z = self.z - (p * rhs.z),
                .w = self.w - (p * rhs.w)
            };
        }
    };
}

fn Mat4(comptime T: type) type {
    return struct {
        data: [4][4]T,

        const Self = @This();

        pub fn init() Self {
            return Self {
                .data = [_][4]T {
                    [_]T{0, 0, 0, 0},
                    [_]T{0, 0, 0, 0},
                    [_]T{0, 0, 0, 0},
                    [_]T{0, 0, 0, 0}
                }
            };
        }

        pub fn identity() Self {
            return Self {
                .data = [_][4]T {
                    [_]T{1, 0, 0, 0},
                    [_]T{0, 1, 0, 0},
                    [_]T{0, 0, 1, 0},
                    [_]T{0, 0, 0, 1}
                }
            };
        }

        pub fn translation(x: T, y: T, z: T) Self {
            return Self {
                .data = [_][4]T {
                    [_]T{1, 0, 0, x},
                    [_]T{0, 1, 0, y},
                    [_]T{0, 0, 1, z},
                    [_]T{0, 0, 0, 1}
                }
            };
        }

        pub fn rotation_x(angle: T) Self {
            const s = std.math.sin(angle);
            const c = std.math.cos(angle);
            return Self {
                .data = [_][4]T {
                    [_]T{1,  0,  0,  0},
                    [_]T{0,  c,  s,  0},
                    [_]T{0, -s,  c,  0},
                    [_]T{0,  0,  0,  1}
                }
            };
        }

        pub fn rotation_y(angle: T) Self {
            const s = std.math.sin(angle);
            const c = std.math.cos(angle);
            return Self {
                .data = [_][4]T {
                    [_]T{ c,  0, -s,  0},
                    [_]T{ 0,  1,  0,  0},
                    [_]T{ s,  0,  c,  0},
                    [_]T{ 0,  0,  0,  1}
                }
            };
        }

        pub fn rotation_z(angle: T) Self {
            const s = std.math.sin(angle);
            const c = std.math.cos(angle);
            return Self {
                .data = [_][4]T {
                    [_]T{ c,  s,  0,  0},
                    [_]T{-s,  c,  0,  0},
                    [_]T{ 0,  0,  1,  0},
                    [_]T{ 0,  0,  0,  1}
                }
            };
        }

        pub fn frustum(l: T, r: T, b: T, t: T, n: T, f: T) Self {
            return Self {
                .data = [_][4]T {
                    [_]T{2 * n / (r - l), 0, 0, 0},
                    [_]T{0, 2 * n / (t - b), 0, 0},
                    [_]T{(r + l) / (r - l), (t + b) / (t - b), -(f + n) / (f - n), -1},
                    [_]T{0, 0, -2 * (f * n) / (f - n), 0}
                }
            };
        }

        pub fn ortho(l: T, r: T, b: T, t: T, n: T, f: T) Self {
            return Self {
                .data = [_][4]T {
                    [_]T{2 / (r - l), 0, 0, 0},
                    [_]T{0, 2 * (t - b), 0, 0},
                    [_]T{0, 0, -2 / (f - n), 0},
                    [_]T{-(r + l) / (r - l), -(t + b) / (t - b), -(f + n) / (f - n), 1}
                }
            };
        }

        pub fn perspective(fov: T, aspect: T, n: T, f: T) Self {
            const a = 1 / std.math.tan(fov / 2);
            return Self {
                .data = [_][4]T {
                    [_]T{a / aspect, 0, 0, 0},
                    [_]T{0, a, 0, 0},
                    [_]T{0, 0, -((f + n) / (f - n)), -1},
                    [_]T{0, 0, -((2 * f * n) / (f - n)), 0}
                }
            };
        }

        // TODO: implementar?
        pub fn from_quat(v: Quat(T)) Self {
            _=v;
        }

        pub fn row(self: Self, i: T) Vec4(T) {
            return Vec4(T) {
                .x = self.data[0][i],
                .y = self.data[1][i],
                .z = self.data[2][i],
                .w = self.data[3][i]
            };
        }

        pub fn col(self: Self, i: T) Vec4(T) {
            return Vec4(T) {
                .x = self.data[i][0],
                .y = self.data[i][1],
                .z = self.data[i][2],
                .w = self.data[i][3]
            };
        }

        pub fn add(self: Self, rhs: Self) Self {
            return Self {
                .data = [_][4]T {
                    [_]T{self.data[0][0] + rhs.data[0][0], self.data[0][1] + rhs.data[0][1], self.data[0][2] + rhs.data[0][2], self.data[0][3] + rhs.data[0][3]},
                    [_]T{self.data[1][0] + rhs.data[1][0], self.data[1][1] + rhs.data[1][1], self.data[1][2] + rhs.data[1][2], self.data[1][3] + rhs.data[1][3]},
                    [_]T{self.data[2][0] + rhs.data[2][0], self.data[2][1] + rhs.data[2][1], self.data[2][2] + rhs.data[2][2], self.data[2][3] + rhs.data[2][3]},
                    [_]T{self.data[3][0] + rhs.data[3][0], self.data[3][1] + rhs.data[3][1], self.data[3][2] + rhs.data[3][2], self.data[3][3] + rhs.data[3][3]}
                }
            };
        }

        pub fn sub(self: Self, rhs: Self) Self {
            return Self {
                .data = [_][4]T {
                    [_]T{self.data[0][0] - rhs.data[0][0], self.data[0][1] - rhs.data[0][1], self.data[0][2] - rhs.data[0][2], self.data[0][3] - rhs.data[0][3]},
                    [_]T{self.data[1][0] - rhs.data[1][0], self.data[1][1] - rhs.data[1][1], self.data[1][2] - rhs.data[1][2], self.data[1][3] - rhs.data[1][3]},
                    [_]T{self.data[2][0] - rhs.data[2][0], self.data[2][1] - rhs.data[2][1], self.data[2][2] - rhs.data[2][2], self.data[2][3] - rhs.data[2][3]},
                    [_]T{self.data[3][0] - rhs.data[3][0], self.data[3][1] - rhs.data[3][1], self.data[3][2] - rhs.data[3][2], self.data[3][3] - rhs.data[3][3]}
                }
            };
        }

        pub fn scale(self: Self, k: T) Self {
            return Self {
                .data = [_][4]T {
                    [_]T{self.data[0][0] * k, self.data[0][1] * k, self.data[0][2] * k, self.data[0][3] * k},
                    [_]T{self.data[1][0] * k, self.data[1][1] * k, self.data[1][2] * k, self.data[1][3] * k},
                    [_]T{self.data[2][0] * k, self.data[2][1] * k, self.data[2][2] * k, self.data[2][3] * k},
                    [_]T{self.data[3][0] * k, self.data[3][1] * k, self.data[3][2] * k, self.data[3][3] * k}
                }
            };
        }

        pub fn mult(self: Self, rhs: Self) Self {
            return Self {
                .data = [_][4]T {
                    [_]T{
                        self.data[0][0] * rhs.data[0][0] + self.data[0][1] * rhs.data[1][0] + self.data[0][2] * rhs.data[2][0] + self.data[0][3] * rhs.data[3][0],
                        self.data[0][0] * rhs.data[0][1] + self.data[0][1] * rhs.data[1][1] + self.data[0][2] * rhs.data[2][1] + self.data[0][3] * rhs.data[3][1],
                        self.data[0][0] * rhs.data[0][2] + self.data[0][1] * rhs.data[1][2] + self.data[0][2] * rhs.data[2][2] + self.data[0][3] * rhs.data[3][2],
                        self.data[0][0] * rhs.data[0][3] + self.data[0][1] * rhs.data[1][3] + self.data[0][2] * rhs.data[2][3] + self.data[0][3] * rhs.data[3][3]
                    },
                    [_]T{
                        self.data[1][0] * rhs.data[0][0] + self.data[1][1] * rhs.data[1][0] + self.data[1][2] * rhs.data[2][0] + self.data[1][3] * rhs.data[3][0],
                        self.data[1][0] * rhs.data[0][1] + self.data[1][1] * rhs.data[1][1] + self.data[1][2] * rhs.data[2][1] + self.data[1][3] * rhs.data[3][1],
                        self.data[1][0] * rhs.data[0][2] + self.data[1][1] * rhs.data[1][2] + self.data[1][2] * rhs.data[2][2] + self.data[1][3] * rhs.data[3][2],
                        self.data[1][0] * rhs.data[0][3] + self.data[1][1] * rhs.data[1][3] + self.data[1][2] * rhs.data[2][3] + self.data[1][3] * rhs.data[3][3]
                    },
                    [_]T{
                        self.data[2][0] * rhs.data[0][0] + self.data[2][1] * rhs.data[1][0] + self.data[2][2] * rhs.data[2][0] + self.data[2][3] * rhs.data[3][0],
                        self.data[2][0] * rhs.data[0][1] + self.data[2][1] * rhs.data[1][1] + self.data[2][2] * rhs.data[2][1] + self.data[2][3] * rhs.data[3][1],
                        self.data[2][0] * rhs.data[0][2] + self.data[2][1] * rhs.data[1][2] + self.data[2][2] * rhs.data[2][2] + self.data[2][3] * rhs.data[3][2],
                        self.data[2][0] * rhs.data[0][3] + self.data[2][1] * rhs.data[1][3] + self.data[2][2] * rhs.data[2][3] + self.data[2][3] * rhs.data[3][3]
                    },
                    [_]T{
                        self.data[3][0] * rhs.data[0][0] + self.data[3][1] * rhs.data[1][0] + self.data[3][2] * rhs.data[2][0] + self.data[3][3] * rhs.data[3][0],
                        self.data[3][0] * rhs.data[0][1] + self.data[3][1] * rhs.data[1][1] + self.data[3][2] * rhs.data[2][1] + self.data[3][3] * rhs.data[3][1],
                        self.data[3][0] * rhs.data[0][2] + self.data[3][1] * rhs.data[1][2] + self.data[3][2] * rhs.data[2][2] + self.data[3][3] * rhs.data[3][2],
                        self.data[3][0] * rhs.data[0][3] + self.data[3][1] * rhs.data[1][3] + self.data[3][2] * rhs.data[2][3] + self.data[3][3] * rhs.data[3][3]
                    }
                }
            };
        }

        pub fn mult_vec4(self: Self, v: Vec4(T)) Self {
            return Vec4(T) {
                .x = (self.data[0][0] * v.x) + (self.data[1][0] * v.y) + (self.data[2][0] * v.z) + (self.data[3][0] * v.w),
                .y = (self.data[0][1] * v.x) + (self.data[1][1] * v.y) + (self.data[2][1] * v.z) + (self.data[3][1] * v.w),
                .z = (self.data[0][2] * v.x) + (self.data[1][2] * v.y) + (self.data[2][2] * v.z) + (self.data[3][2] * v.w),
                .w = (self.data[0][3] * v.x) + (self.data[1][3] * v.y) + (self.data[2][3] * v.z) + (self.data[3][3] * v.w)
            };
        }

        pub fn transpose(self: Self) Self {
            return Self {
                .data = [_][4]T {
                    [_]T{self.data[0][0], self.data[1][0], self.data[2][0], self.data[3][0]},
                    [_]T{self.data[0][1], self.data[1][1], self.data[2][1], self.data[3][1]},
                    [_]T{self.data[0][2], self.data[1][2], self.data[2][3], self.data[3][2]},
                    [_]T{self.data[0][3], self.data[1][3], self.data[2][3], self.data[3][3]},
                }
            };
        }

        pub fn translate(self: Self, x: T, y: T, z: T) Self {
            return self.mult_vec4(Vec4(T){ .x = x, .y = y, .z = z, .w = 0 });
        }

        pub fn translate_vec3(self: Self, v: Vec3(T)) Self {
            return self.mult_vec4(Vec4(T){ .x = v.x, .y = v.y, .z = v.z, .w = 0 });
        }

        pub fn translate_vec4(self: Self, v: Vec4(T)) Self {
            return self.mult_vec4(Vec4(T){ .x = v.x, .y = v.y, .z = v.z, .w = v.w });
        }

        // TODO: implementar
        pub fn rotate(self: Self, angle: T) Self {
            const s = std.math.sin(angle);
            const c = std.math.cos(angle);
            _ = s;
            _ = c;
            _ = self;

            return Self {
                .data = [_][4]T {
                    [_]T{0, 0, 0, 0},
                    [_]T{0, 0, 0, 0},
                    [_]T{0, 0, 0, 0},
                    [_]T{0, 0, 0, 0}
                }
            };
        }

        pub fn rotate_x(self: Self, angle: T) Self {
            return self.mult(self.rotation_x(angle));
        }

        pub fn rotate_y(self: Self, angle: T) Self {
            return self.mult(self.rotation_y(angle));
        }

        pub fn rotate_z(self: Self, angle: T) Self {
            return self.mult(self.rotation_z(angle));
        }

        // TODO: implementar
        pub fn look_at(self: Self, eye: Vec3(T), center: Vec3(T), up: Vec3(T)) Self {
            _=eye;
            _=center;
            _=up;
            _=self;
            return Self {
                .data = [_][4]T {
                    [_]T{0, 0, 0, 0},
                    [_]T{0, 0, 0, 0},
                    [_]T{0, 0, 0, 0},
                    [_]T{0, 0, 0, 0}
                }
            };
        }
    };
}

fn Quat(comptime T: type) type {
    return struct {
        x: T,
        y: T,
        z: T,
        w: T,

        const Self = @This();
        pub fn init(x: T, y: T, z: T, w: T) Self {
            return Self {
                .x = x,
                .y = y,
                .z = z,
                .w = w
            };
        }

        pub fn identity() Self {
            return Self {
                .x = 0,
                .y = 0,
                .z = 0,
                .w = 1
            };
        }

        // TODO: implementar?
        pub fn from_mat4(m: Mat4(T)) Self {
            _=m;
        }

        pub fn mult(self: Self, rhs: Self) Self {
            _=self;
            _=rhs;
            return Self {
            };
        }

        pub fn conj(self: Self, rhs: Self) Self {
            _=self;
            _=rhs;
            return Self {
            };
        }

        pub fn rotate(self: Self, a: T, v: Vec3(T)) Self {
            _=self;
            _=a;
            _=v;
            return Self {
            };
        }
    };
}

// floating point version
pub const Vec2f = Vec2(f32);
pub const Vec2d = Vec2(f64);

pub const Vec3f = Vec3(f32);
pub const Vec3d = Vec3(f64);

pub const Vec4f = Vec4(f32);
pub const Vec4d = Vec4(f64);

pub const Quatf = Quat(f32);
pub const Quatd = Quat(f64);

// signed integer version
pub const Vec2i = Vec2(i32);
pub const Vec2l = Vec2(i64);

pub const Vec3i = Vec3(i32);
pub const Vec3l = Vec3(i64);

pub const Vec4i = Vec4(i32);
pub const Vec4l = Vec4(i64);

pub const Quati = Quat(i32);
pub const Quatl = Quat(i64);

pub const Mat4f = Mat4(f32);
pub const Mat4d = Mat4(f64);
