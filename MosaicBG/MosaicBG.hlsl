// Pixel shader input structure
struct PS_INPUT
{
  float4 Tint : COLOR0;
  float2 texCoord : TEXCOORD0;
  float4 Position : SV_POSITION;
};

// Pixel shader output structure
struct PS_OUTPUT
{
    float4 Color   : SV_TARGET;
};

// Global variables
Texture2D<float4> bg : register(t1);
sampler bgSampler : register(s1);

cbuffer PS_VARIABLES : register(b0)
{
	float fX;
	float fY;
	float fOx;
	float fOy;
};

PS_OUTPUT ps_main( in PS_INPUT In )
{
  // Output pixel
  PS_OUTPUT Out;
  Out.Color = bg.Sample(bgSampler,float2(int((In.texCoord.x-fOx)*fX)/fX+fOx,int((In.texCoord.y-fOy)*fY)/fY)+fOy);
	Out.Color *= In.Tint;
  return Out;
}
