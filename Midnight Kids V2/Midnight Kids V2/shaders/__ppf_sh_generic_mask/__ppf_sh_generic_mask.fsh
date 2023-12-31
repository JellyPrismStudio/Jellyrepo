
varying vec2 v_vTexcoord;

// >> uniforms
uniform float u_mask_power;
uniform float u_mask_scale;
uniform float u_mask_smoothness;
uniform sampler2D u_mask_tex;

// >> dependencies
float saturate(float x) {
	return clamp(x, 0.0, 1.0);
}

float mask_radial(vec2 uv, vec2 center, float power, float scale, float smoothness) {
	float smoothh = mix(scale, 0.0, smoothness);
	float sc = scale / 2.0;
	float mask = pow(1.0-saturate((length(uv-center)-sc) / ((smoothh-0.001)-sc)), power);
	return mask;
}

void main() {
	vec2 uv = v_vTexcoord;
	vec4 col_tex = texture2D(gm_BaseTexture, uv);
	vec4 col_mask = texture2D(u_mask_tex, uv);
	float mask = mask_radial(uv, vec2(0.5), u_mask_power, u_mask_scale, u_mask_smoothness);
	gl_FragColor = mix(col_tex, col_mask, mask);
}
