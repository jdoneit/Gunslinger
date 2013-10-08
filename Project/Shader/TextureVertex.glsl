attribute vec4 Position; 
attribute vec4 SourceColor; 
attribute vec2 TexCoordIn;

varying vec4 DestinationColor; 
varying vec2 TexCoordOut;

//uniform mat4 ModelViewProjection;
uniform vec4 ModelViewProjection[4];
uniform vec4 GlobalColor;
uniform vec2 TexOffset;
uniform vec2 TexScale;
uniform vec2 TexMirror;

void main(void) {

    DestinationColor = GlobalColor; 
    
    mat4 mvp = mat4(ModelViewProjection[0], ModelViewProjection[1], ModelViewProjection[2], ModelViewProjection[3]);
    gl_Position = mvp * Position;

//    gl_Position = ModelViewProjection * Position;

    vec2 coord = sign(TexCoordIn);
    coord *= TexMirror;
    coord = coord / 2.0 + 0.5;
    TexCoordOut = coord * TexScale + TexOffset;
}
