// The uniform variable is set up in the javascript code and the same for all vertices
uniform vec3 orbPosition;

// This is a "varying" variable and interpolated between vertices and across fragments.
// The shared variable is initialized in the vertex shader and passed to the fragment shader.
out float vcolor;
out float orbDistance;

void main() {

    // Q1C:
    // HINT: GLSL PROVIDES THE DOT() FUNCTION 
  	// HINT: SHADING IS CALCULATED BY TAKING THE DOT PRODUCT OF THE NORMAL AND LIGHT DIRECTION VECTORS
    
    mat4 invModelMatrix = inverse(modelMatrix);
    vec3 mvOrbPosition = vec3(invModelMatrix * vec4(orbPosition, 1.0));
    vec3 lightDirection = normalize(mvOrbPosition - position);
    vcolor = dot(normal, lightDirection);

    // Q1D:
    // HINT: Compute distance in World coordinate to make the magnitude easier to interpret
    // HINT: GLSL has a build-in distance() function
    vec3 wvPosition = vec3(modelMatrix * vec4(position, 1.0));
    orbDistance = distance(wvPosition, orbPosition);// REPLACE ME

    gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);
}
