/*
varying lowp vec4 DestinationColor;
varying lowp vec2 TexCoordOut;
uniform sampler2D Texture;

#define AMPLIFER 2.0
#define OffsetRight     vec2(0.0031,0)
#define OffsetLeft      vec2(-0.0031,0)
#define OffsetUp        vec2(0.0031,0)
#define OffsetDown      vec2(-0.0031,0)

highp vec4 getPixel(in highp int x, in highp int y)
{
//    x = x / 326.0;
//    y = y / 326.0;
	return texture2D(Texture, (TexCoordOut.xy + vec2(x, y)));
}

void main(void) {
    mediump vec4 sum = abs(texture2D(Texture, (TexCoordOut.xy + OffsetUp)) - texture2D(Texture, (TexCoordOut.xy + OffsetDown)));
	sum += abs(texture2D(Texture, (TexCoordOut.xy + OffsetRight)) - texture2D(Texture, (TexCoordOut.xy + OffsetLeft)));
	sum /= 2.0;
    
	mediump vec4 color = texture2D(Texture, TexCoordOut.xy);
	color.r += length(sum) * AMPLIFER;
	gl_FragColor = color;    
}

	float d = length(uv);
	vec2 st = uv*0.1 + 0.2*vec2(cos(0.071*iGlobalTime+d),
								sin(0.073*iGlobalTime-d));

    vec3 col = texture2D( iChannel0, st ).xyz;
    float w = col.x;
	col *= 1.0 - texture2D( iChannel0, 0.4*uv + 0.1*col.xy  ).xyy;
	col *= w*2.0;
	
	col *= 1.0 + 2.0*d;
	gl_FragColor = vec4(col,1.0);
*/

varying lowp vec4 DestinationColor;
varying lowp vec2 TexCoordOut;
uniform sampler2D Texture;
uniform lowp float Time;
uniform lowp float GlowFac;

void main(void) {

//    lowp vec2 uv = TexCoordOut / vec2(261.0,198.0);
//    lowp float d = length(uv);
//    lowp vec2 st = TexCoordOut * 0.1 + 0.2 * vec2(cos(0.071*Time+d), sin(0.073*Time-d));
//    
//    lowp vec3 col = texture2D(Texture, st).xyz;
//    lowp float w = col.x;
//    col *= 1.0 - texture2D(Texture, 0.4*uv + 0.1*col.xy).xyy;
//    col *= w*2.0;
//    col *= 1.0 + 2.0*d;
//    gl_FragColor = vec4(col, 1.0);

    lowp vec4 color = DestinationColor * texture2D(Texture, TexCoordOut);
    
    lowp float invfac = 1.0 - GlowFac;

    color.r = color.r * invfac + color.a * GlowFac;
    color.g = color.g * invfac + color.a * GlowFac;
    color.b = color.b * invfac + color.a * GlowFac;

//    lowp float m = sin(Time)*8.0;
//    color.rgb -= mod(gl_FragCoord.x, m) < (m / 2.0) ? (GlowFac / 2.0) : 0.0;

    color.rgb -= sin(Time*12.0+gl_FragCoord.x)*GlowFac;
    gl_FragColor = color;
}