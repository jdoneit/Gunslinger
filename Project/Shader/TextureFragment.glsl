varying lowp vec4 DestinationColor;
varying lowp vec2 TexCoordOut;
uniform sampler2D Texture;

//const lowp float redInBlack = 0.0;
//const lowp float redInGamma = 1.0;
//const lowp float redInWhite = 255.0;
//const lowp float redOutBlack = 0.0;
//const lowp float redOutWhite = 255.0;
//


void main(void) {
//    lowp vec4 color = DestinationColor * texture2D(Texture, TexCoordOut);
//    color.x = (pow(((color.x * 255.0) - redInBlack) / (redInWhite - redInBlack),
//                redInGamma) * (redOutWhite - redOutBlack) + redOutBlack) / 255.0;
    gl_FragColor = DestinationColor * texture2D(Texture, TexCoordOut);
}