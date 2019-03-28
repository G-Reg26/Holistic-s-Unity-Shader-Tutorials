Shader "Custom/ShaderTutorial_5"
{
	SubShader
	{
		CGPROGRAM
		#pragma surface surf Lambert

        struct Input
        {
            float3 viewDir;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
			half dotp = dot(IN.viewDir, o.Normal);
			o.Emission = float3(1 - dotp, 0, 0);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
