attribute vec4 Position; 
attribute vec4 SourceColor; 
attribute vec2 TexCoordIn;
attribute vec4 Index;

varying vec4 DestinationColor; 
varying vec2 TexCoordOut;

//uniform mat4 ModelViewProjection;
uniform vec4 ModelViewProjection[4];
uniform vec4 GlobalColor;
uniform vec3 InstanceData[512];
uniform float InstanceColor[128];
uniform sampler2D Texture;

void main(void) {

    int instanceIndex = int(Index[0]);

    vec4 m0 = vec4(InstanceData[instanceIndex + 0].xyz,0);
    vec4 m1 = vec4(InstanceData[instanceIndex + 1].xyz,0);
    vec4 m2 = vec4(InstanceData[instanceIndex + 2].xyz,0);
    vec4 m3 = vec4(InstanceData[instanceIndex + 3].xyz,1);

    mat4 modelMatrix = mat4(m0, m1, m2, m3);

    vec4 color = vec4(InstanceColor[instanceIndex + 0],
                      InstanceColor[instanceIndex + 1],
                      InstanceColor[instanceIndex + 2],
                      InstanceColor[instanceIndex + 3]);

    DestinationColor = color; 
    
    mat4 mvp = mat4(ModelViewProjection[0], ModelViewProjection[1], ModelViewProjection[2], ModelViewProjection[3]);

    gl_Position = mvp * modelMatrix * Position;
//    gl_Position = ModelViewProjection * modelMatrix * Position;
    TexCoordOut = TexCoordIn;
    

}
