Shader "Custom/ShaderTutorial_9_2"
{
	Properties
	{
		_Color("Color", Color) = (1,1,1,1)
		_MetallicTex("Metallic (R)", 2D) = "white" {}
		_SpecColor("Specular", Color) = (1,1,1,1)
	}
	SubShader
	{
		// Not necessary, done by default
		Tags{ "Queue" = "Geometry" }

		CGPROGRAM
			#pragma surface surf StandardSpecular

			float4 _Color;
			half _Metallic;
			sampler2D _MetallicTex;

			struct Input
			{
				float2 uv_MetallicTex;
			};

			void surf(Input IN, inout SurfaceOutputStandardSpecular o)
			{
				o.Albedo = _Color.rgb;
				o.Smoothness = tex2D(_MetallicTex, IN.uv_MetallicTex).r;
				o.Specular = _SpecColor.rgb;
			}
		ENDCG
	}
	FallBack "Diffuse"
}
