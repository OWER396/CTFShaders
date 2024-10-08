// Pixel shader input structure
struct PS_INPUT
{
    float4 Position   : POSITION;
    float2 Texture    : TEXCOORD0;
};

// Pixel shader output structure
struct PS_OUTPUT
{
    float4 Color   : COLOR0;
};

// Global variables
sampler2D bg : register(s1);
float fX;
float fY;
float fOx;
float fOy;

PS_OUTPUT ps_main( in PS_INPUT In )
{
  // Output pixel
  PS_OUTPUT Out;
  Out.Color = tex2D(bg,float2(int((In.Texture.x-fOx)*fX)/fX+fOx,int((In.Texture.y-fOy)*fY)/fY)+fOy);
  return Out;
}

// Effect technique
technique tech_main
{
    pass P0
    {
        // shaders
        VertexShader = NULL;
        PixelShader  = compile ps_2_0 ps_main();
    }  
}