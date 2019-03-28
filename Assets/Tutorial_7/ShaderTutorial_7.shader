Shader "Custom/ShaderTutorial_7"
{
	Properties
	{
		_myTex("Texture", 2D) = "white" {}
		_RimColor("Rim Color", Color) = (0, 0.5, 0.5, 0.0)
		_mySlider("Stripe Width", Range(3, 20)) = 10
	}
		SubShader
		{
			CGPROGRAM
				#pragma surface surf Lambert

				sampler2D _myTex;

				struct Input
				{                     
					float2 uv_myTex;
					float3 viewDir;
					float3 worldPos;
				};

				float4 _RimColor;
				half _mySlider;

				void surf(Input IN, inout SurfaceOutput o)
				{
					half rim = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));
					//o.Albedo = tex2D(_myTex, IN.uv_myTex);
					//o.Emission = IN.worldPos.y > 1 ? float3(0, 1, 0) : 0;
					o.Emission = frac(IN.worldPos.y * _mySlider * 0.5) > 0.4 ? float3(0, 1, 0) * rim : float3(1, 0, 0) * rim;
				}
			ENDCG
		}
	FallBack "Diffuse"
}
