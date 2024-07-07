#version 460

in vec3 vaPosition;
in vec2 vaUV0;
in vec4 vaColor;
in ivec2 vaUV2;

uniform vec3 chunkOffset;
uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;
uniform vec3 cameraPosition;
uniform mat4 gbufferModelViewInverse;

out vec2 texCoord;
out vec3 foliageColor;
out vec2 lightMapCoords;

void main(){
    texCoord = vaUV0;
    foliageColor = vaColor.rgb;
    lightMapCoords = vaUV2 * (1.0 / 256.0) + (1.0 / 32.0);
    
    //vec3 worldSpaceVertexPosition = cameraPosition + (gbufferModelViewInverse * modelViewMatrix * vec4(vaPosition+chunkOffset,1)).xyz;

    //float distanceFromCamera = distance(worldSpaceVertexPosition, cameraPosition);

    gl_Position = projectionMatrix * modelViewMatrix * vec4(vaPosition + chunkOffset /*- .001 * distanceFromCamera*/, 1);
};