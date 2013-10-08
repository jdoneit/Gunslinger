attribute vec4 Position; 
attribute vec4 SourceColor; 

varying vec4 DestinationColor; 

uniform mat4 ModelViewProjection;
uniform vec4 GlobalColor;

void main(void) {
    
    DestinationColor = SourceColor * GlobalColor; 
    gl_Position = ModelViewProjection * Position;
}
