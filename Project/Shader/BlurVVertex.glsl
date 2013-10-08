attribute vec4 Position; 
attribute vec4 SourceColor; 
attribute vec2 TexCoordIn;

varying lowp vec4 DestinationColor;
varying lowp vec2 TexCoordOut;
varying lowp vec2 BlurTexCoords[3];


uniform lowp mat4 ModelViewProjection;
uniform lowp vec4 GlobalColor;
uniform lowp vec2 TexOffset;
uniform lowp vec2 TexScale;
uniform lowp vec2 TexMirror;

void main(void) {

    DestinationColor = SourceColor; 
    gl_Position = ModelViewProjection * Position;

    vec2 coord = sign(TexCoordIn);
    coord *= TexMirror;
    coord = coord / 2.0 + 0.5;

    TexCoordOut = coord * TexScale + TexOffset;
    
    BlurTexCoords[ 0] = TexCoordOut + vec2(-0.028, 0.0);
    BlurTexCoords[ 1] = TexCoordOut + vec2(-0.024, 0.0);
    BlurTexCoords[ 2] = TexCoordOut + vec2(-0.020, 0.0);
//    BlurTexCoords[ 3] = TexCoordOut + vec2(-0.016, 0.0);
//    BlurTexCoords[ 4] = TexCoordOut + vec2(-0.012, 0.0);
//    BlurTexCoords[ 5] = TexCoordOut + vec2(-0.008, 0.0);
//    BlurTexCoords[ 6] = TexCoordOut + vec2(-0.004, 0.0);
//    BlurTexCoords[ 7] = TexCoordOut + vec2( 0.004, 0.0);
//    BlurTexCoords[ 8] = TexCoordOut + vec2( 0.008, 0.0);
//    BlurTexCoords[ 9] = TexCoordOut + vec2( 0.012, 0.0);
//    BlurTexCoords[10] = TexCoordOut + vec2( 0.016, 0.0);
//    BlurTexCoords[11] = TexCoordOut + vec2( 0.020, 0.0);
//    BlurTexCoords[12] = TexCoordOut + vec2( 0.024, 0.0);
//    BlurTexCoords[13] = TexCoordOut + vec2( 0.028, 0.0);

}
