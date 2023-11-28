
/*------------------------------------------------------------------
You cannot redistribute this pixel shader source code anywhere.
Only compiled binary executables. Don't remove this notice, please.
Copyright (C) 2023 Mozart Junior (FoxyOfJungle). Kazan Games Ltd.
Website: https://foxyofjungle.itch.io/ | Discord: FoxyOfJungle#0167
-------------------------------------------------------------------*/

varying vec2 v_TexelSize;
varying vec2 v_vTexcoord;

uniform float u_slowmo_threshold;
uniform float u_slowmo_debug;
uniform sampler2D u_slowmo_tex;

vec4 sample_box4(sampler2D tex, vec2 uv, float delta) {
	vec4 d = v_TexelSize.xyxy * vec2(-delta, delta).xxyy;
	vec4 col;
	col =  (texture2D(tex, uv + d.xy));
	col += (texture2D(tex, uv + d.zy));
	col += (texture2D(tex, uv + d.xw));
	col += (texture2D(tex, uv + d.zw));
	return col * 0.25; // (1.0 / 4.0)
}

const vec3 lum_weights = vec3(0.299, 0.587, 0.114);
float get_luminance(vec3 color) {
	return dot(color, lum_weights);
}

vec3 saturate(vec3 x) {
    return clamp(x, 0.0, 1.0);
}

vec3 blend(vec3 source, vec3 dest) {
	return source + dest - source * dest;
}

void main() {
	vec2 uv = v_vTexcoord;
	vec4 slowmo_col = sample_box4(u_slowmo_tex, uv, 1.0);
	vec4 col_tex = texture2D(gm_BaseTexture, uv);
	
	if (u_slowmo_threshold > 0.0) {
		col_tex.rgb = mix(blend(col_tex.rgb, slowmo_col.rgb), slowmo_col.rgb, floor(u_slowmo_debug + 0.5));
	} else {
		col_tex = mix(col_tex, slowmo_col, slowmo_col.r);
	}
	
	gl_FragColor = col_tex;
}
