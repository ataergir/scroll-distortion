uniform sampler2D uTexture;
uniform vec2 uOffset;

varying vec2 vUv;

float PI = 3.141529;

vec3 deformationCurve(vec3 pos, vec2 uv, vec2 offset) {
    pos.y += 0.5 * sin(uv.y * PI) * offset.y;
    // pos.x += 5. * sin(uv.y * PI) * offset.x;
    return pos;
}

void main() {
    vUv = uv;
    vec3 newPos = deformationCurve(position, uv, uOffset);
    gl_Position = projectionMatrix * modelViewMatrix * vec4(newPos, 1.0);
}