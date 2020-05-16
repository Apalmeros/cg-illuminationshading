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
	
	vec3 light_source = normalize(light_position - frag_pos);
	vec3 viewV = normalize(camera_position - frag_pos);
	vec3 reflect = normalize(-reflect(light_source,frag_normal));

	//ambient
	vec3 ambient_color = light_ambient;

	//diffuse
	vec3 diffuse_color = light_position * max(dot(frag_pos, light_source), 0.0);

	//specular
	vec3 specular_color = light_color * pow(max(dot(reflect, viewV), 0.0), material_shininess);

	
    FragColor = vec4(material_color, 1.0);
}
