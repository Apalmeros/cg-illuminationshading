#version 300 es

precision mediump float;

in vec3 frag_pos;
in vec3 frag_normal;

uniform vec3 light_ambient;
uniform vec3 light_position;
uniform vec3 light_color;
uniform vec3 camera_position;
uniform vec3 material_color;      // Ka and Kd
uniform vec3 material_specular;   // Ks
uniform float material_shininess; // n

out vec4 FragColor;

void main() {
	float distance = length(light_position - camera_position);

	vec3 lightVector = normalize(light_position - camera_postion);

	float diffuse = max(dot(frag_normal, lightVector), 0.1);

	diffuse = diffuse * (1.0 / (1.0 + (0.25 * distance * distance)));
    FragColor = vec4(material_color, 1.0) * diffuse;
}
