shader_type spatial;
render_mode  world_vertex_coords;

uniform sampler2D tex;
uniform float near;
uniform float far;
uniform float top;
uniform float bottom;
uniform float right;
uniform float left;
uniform mat4 light_matrix;

varying vec4 uv_tex;

void vertex() {

	// OpenGL projection matrix
	mat4 light_proj = mat4(
		vec4(2.0*near/(right-left), 0, 0, 0),
		vec4(0, 2.0*near/(top-bottom), 0, 0),
		vec4((right+left)/(right-left), (top+bottom)/(top-bottom), -(far+near)/(far-near), -1.0),
		vec4(0, 0, -2.0*far*near/(far-near), 0)
	);
	
	// Scale and translate as the origin after projection is at the center
	// of light_proj's near plane but the origin of our texture is at the lower
	// left corner
	mat4 scale_bias = mat4(
		vec4(-0.5, 0, 0, 0),
		vec4(0, 0.5, 0, 0),
		vec4(0, 0, 0.5, 0),
		vec4(0.5, 0.5, 0.5, 1.0)
	);
	
	uv_tex = scale_bias * light_proj * inverse(light_matrix) * vec4(VERTEX, 1.0);
	
}

void fragment() {

	vec4 uv = uv_tex; // It's important to keep the W coordinate here !

	ALBEDO = textureProj(tex, uv).rgb;
	
}