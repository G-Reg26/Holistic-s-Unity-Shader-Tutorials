Shader "Custom/ShaderTutorial_6"
{
	Properties
	{
		_myTex("Texture", 2D) = "white" {}
		_RimColor("Rim Color", Color) = (0, 0.5, 0.5, 0.0)
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
			};

			float4 _RimColor;
			half _mySlider;

			void surf (Input IN, inout SurfaceOutput o)
			{
				half rim = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));
				o.Albedo = tex2D(_myTex, IN.uv_myTex);
				o.Emission = _RimColor.rgb * pow(rim, 3);
			}
        ENDCG
    }
    FallBack "Diffuse"
}
