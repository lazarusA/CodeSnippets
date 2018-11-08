function Clifford(x::Float64, y::Float64, a::Float64, b::Float64, c::Float64, d::Float64)
    sin(a * y) + c * cos(a * x), sin(b * x) + d * cos(b * y)
end
function De_Jong(x::Float64, y::Float64, a::Float64, b::Float64, c::Float64, d::Float64)
    sin(a * y) - cos(b * x),sin(c * x) - cos(d * y)
end
function Svensson(x::Float64, y::Float64, a::Float64, b::Float64, c::Float64, d::Float64)
    d * sin(a * x) - sin(b * y), c * cos(a * x) + cos(b * y)
end
function Bedhead(x::Float64, y::Float64, a::Float64, b::Float64, c::Float64, d::Float64)
    sin(x*y/b)*y + cos(a*x-y), x + sin(y)/b
end
function Fractal_Dream(x::Float64, y::Float64, a::Float64, b::Float64, c::Float64, d::Float64)
    sin(y*b)+c*sin(x*b), sin(x*a) + d*sin(y*a)
end
function trajectory(fn, x0::Float64, y0::Float64, a::Float64, b::Float64, c::Float64, d::Float64, 
        dθ::Float64,  n::Int64)
    x, y, θ = zeros(n), zeros(n), 0.0
    x[1], y[1] = x0, y0
    for i = 1:n
        xd, yd = fn(x[i], y[i], a, b, c, d)
        @inbounds x[i+1], y[i+1] = xd*cos(θ), yd*cos(θ)
        θ += dθ
    end
    x, y
end
#Examples
cliffordExamples = [
    [-1.3, -1.3, -1.8, -1.9],
    [-1.4, 1.6, 1.0, 0.7],
    [1.7, 1.7, 0.6, 1.2],
    [1.7, 0.7, 1.4, 2.0],
    [-1.6, 1.6, 0.7, -1.0],
    [-1.32, -1.65, 0.74, 1.81]]
De_JongExamples = [
    [-1.244, -1.251, -1.815, -1.908],
    [1.4, -2.3, 2.4, -2.1],
    [1.4, 1.56, 1.4, -6.56],
    [2.01, -2.53, 1.61, -0.33],
    [-0.827, -1.637, 1.659, -0.943],
    [-0.709, 1.638, 0.452, 1.740]]
SvenssonExamples = [
    [1.5, -1.8, 1.6, 0.9],
    [-1.78, 1.29, -0.09, -1.18],
    [-0.91, -1.29, -1.97, -1.56],
    [1.4, 1.56, 1.4, -6.56],
    [-0.827, -1.637, 1.659, -0.943],
    [1.7, 1.7, 0.6, 1.2]]
BedheadExamples = [
    [-0.81, -0.92, 0.0, 0.0],
    [-0.64, 0.76, 0.0, 0.0],
    [0.06, 0.98, 0.0, 0.0],
    [-0.67, 0.83, 0.0, 0.0],
    [0.65343, 0.7345345, 0.0, 0.0],
    [1.7, 1.7, 0.0, 0.0]]

attractorExamples = OrderedDict(Clifford => cliffordExamples, 
    De_Jong => De_JongExamples, Svensson => SvenssonExamples,
    Bedhead => BedheadExamples)