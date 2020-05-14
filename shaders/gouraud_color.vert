#version 300 es
/*
precision highp float;

in vec3 vertex_position;
in vec3 vertex_normal;

uniform vec3 light_ambient;
uniform vec3 light_position;
uniform vec3 light_color;
uniform vec3 camera_position;
uniform float material_shininess; // n
uniform mat4 model_matrix;
uniform mat4 view_matrix;
uniform mat4 projection_matrix;

out vec3 ambient;
out vec3 diffuse;
out vec3 specular;

void main() {
	vec3 modelViewVertex = vec3(model_matrix * view_matrix * vec4(vertex_position, 1.0));

	vec3 modelViewNormal = vec3(model_matrix * view_matrix * vertex_normal);

	float distance = length(light_position - modelViewVertex);

	vec3 lightVector = normalize(light_position - modelViewVertex);

	float diffuse = max(dot(modelViewNormal, lightVector), 0.1);

	diffuse = diffuse * (1.0 / (1.0 + (0.25 * distance * distance)));

	v_Color = light_color * diffuse;

    gl_Position = projection_matrix * view_matrix * model_matrix * vec4(vertex_position, 1.0);
}
*/
