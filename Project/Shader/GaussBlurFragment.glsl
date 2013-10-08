varying lowp vec4 DestinationColor;
varying lowp vec2 TexCoordOut;
varying lowp vec2 BlurTexCoords[2];

uniform sampler2D Texture;
uniform mediump float Coefficients[3];


void main(void)
{
    mediump vec3 A = Coefficients[0] * texture2D(Texture, BlurTexCoords[0]).xyz;
    mediump vec3 B = Coefficients[1] * texture2D(Texture, TexCoordOut).xyz;
    mediump vec3 C = Coefficients[2] * texture2D(Texture, BlurTexCoords[1]).xyz;
    mediump vec3 color = A + B + C;
    gl_FragColor = vec4(color, 1);

}