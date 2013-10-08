varying lowp vec4 DestinationColor;
varying lowp vec2 TexCoordOut;
varying lowp vec2 BlurTexCoords[3];

uniform sampler2D Texture;

void main(void)
{
    
    gl_FragColor = vec4(0.0);
    gl_FragColor += texture2D(Texture, BlurTexCoords[ 0])*0.0044299121055113265;
    gl_FragColor += texture2D(Texture, BlurTexCoords[ 1])*0.00895781211794;
    gl_FragColor += texture2D(Texture, BlurTexCoords[ 2])*0.0215963866053;
//    gl_FragColor += texture2D(Texture, BlurTexCoords[ 3])*0.0443683338718;
//    gl_FragColor += texture2D(Texture, BlurTexCoords[ 4])*0.0776744219933;
//    gl_FragColor += texture2D(Texture, BlurTexCoords[ 5])*0.115876621105;
//    gl_FragColor += texture2D(Texture, BlurTexCoords[ 6])*0.147308056121;
//    gl_FragColor += texture2D(Texture, TexCoordOut      )*0.159576912161;
//    gl_FragColor += texture2D(Texture, BlurTexCoords[ 7])*0.147308056121;
//    gl_FragColor += texture2D(Texture, BlurTexCoords[ 8])*0.115876621105;
//    gl_FragColor += texture2D(Texture, BlurTexCoords[ 9])*0.0776744219933;
//    gl_FragColor += texture2D(Texture, BlurTexCoords[10])*0.0443683338718;
//    gl_FragColor += texture2D(Texture, BlurTexCoords[11])*0.0215963866053;
//    gl_FragColor += texture2D(Texture, BlurTexCoords[12])*0.00895781211794;
//    gl_FragColor += texture2D(Texture, BlurTexCoords[13])*0.0044299121055113265;

}