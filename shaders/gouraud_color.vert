#version 300 es

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

	gl_Position = projection_matrix * view_matrix * model_matrix * vec4(vertex_position, 1.0);
	
	//ambient calc
	ambient = light_ambient;
	
	vec3 modelVV = vec3(model_matrix * vec4(vertex_position, 1.0));
	vec3 modelVN = normalize((transpose(inverse(mat3(model_matrix))) * vertex_normal));
	//vec3 modelVN = normalize(vec3(inverse(transpose(mat3(model_matrix))) * vertex_normal));

	//diffuse calc
	vec3 light_source = normalize(light_position - modelVV);
	diffuse = light_position * max(dot(modelVN,light_source), 0.0); 
	
	
	//spec calc
	vec3 viewV = normalize(camera_position - modelVV);
	vec3 reflect = normalize(-reflect(light_source,modelVN));
	//vec3 reflect = reflect(-light_direction, v_normal); 
	specular = light_color * pow(max(dot(reflect,viewV), 0.0), 0.3 * material_shininess);

	


}
