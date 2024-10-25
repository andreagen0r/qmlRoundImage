#version 440
layout(location = 0) in vec2 coord;
layout(location = 0) out vec4 fragColor;
layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;
    float softness;
    float radius;
    float topLeftRadius;
    float topRightRadius;
    float bottomLeftRadius;
    float bottomRightRadius;
};
layout(binding = 1) uniform sampler2D src;

// b.x = width
// b.y = height
// r.x = roundness top-right
// r.y = roundness boottom-right
// r.z = roundness top-left
// r.w = roundness bottom-left
float roundedBox( in vec2 p, in vec2 b, in vec4 r ) {
    r.xy = ( p.x > 0.0 ) ? r.xy : r.zw;
    r.x  = ( p.y > 0.0 ) ? r.x  : r.y;
    vec2 q = abs( p ) - b + r.x;
    return min( max( q.x, q.y ), 0.0 ) + length( max( q, 0.0 ) ) - r.x;
}

void main() {
    vec4 tex = texture(src, coord);
    vec2 center = coord * 2.0 - 1.0;

    vec4 r = vec4(bottomRightRadius > 0.0 ? bottomRightRadius : radius,
                  topRightRadius > 0.0 ? topRightRadius : radius,
                  bottomLeftRadius > 0.0 ? bottomLeftRadius : radius,
                  topLeftRadius > 0.0 ? topLeftRadius : radius
                                 );

    float p = distance(coord, vec2(0.5));
    float delta = fwidth(p);

    float dist = roundedBox(center, vec2(1.0 - delta), r);
    float edge = clamp(softness, 0.01, 1.0);
    float alpha = 1.0 - smoothstep(mix(edge, 0.0, 1.0), edge, dist + softness);

    fragColor = tex * qt_Opacity * alpha;
}
