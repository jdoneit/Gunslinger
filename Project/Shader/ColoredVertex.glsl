attribute vec4 Position; 
attribute vec4 SourceColor; 

varying vec4 DestinationColor; 

//uniform mat4 ModelViewProjection;
uniform vec4 ModelViewProjection[4];
uniform vec4 GlobalColor;

void main(void) {
    
    DestinationColor = SourceColor * GlobalColor; 
    
    mat4 mvp = mat4(ModelViewProjection[0], ModelViewProjection[1], ModelViewProjection[2], ModelViewProjection[3]);

    gl_Position = mvp * Position;
//    gl_Position = ModelViewProjection * Position;
}
