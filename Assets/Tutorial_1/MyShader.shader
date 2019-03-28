/*
Location and name of shader
-Location: Holistic
-Name: HelloShader
*/
Shader "Holistic/HelloShader" {
	//Properties of the shader
	Properties{
		/*
		-Type: Color
		-Name: Example Color
		*/
		_myColor ("Example Color", Color) = (1, 1, 1, 1)
		_myEmission ("Example Emission", Color) = (1, 1, 1, 1)
	}
	//Processing
	SubShader {
		//Start Tag
		CGPROGRAM
			/*
			#pragma: Compiler directive
			surface: Indicates the shader being built is a surface shader
			surf: Name of shader function
			Lambert: Type of lighting to be used
			*/
			#pragma surface surf Lambert
			
			//Input Data from the Model's Mesh (Verticies, normals, UVs)
			struct Input {
				float2 uvMainText;
			};
			
			/*
			To access properties:
			-List them and the type of data they contain
			-Use the same name precisely
			-fixed4: Special shader data type
				-An array of 4 float values
				-Further details later
			*/
			fixed4 _myColor;
			fixed4 _myEmission;

			/*
			Shader function:
			-Takes in the input data stated before (Input IN)
			-Specifies its type of output data (inout SurfaceOutput o)
				-Output type changes depending on the lighting model used
			*/
			void surf(Input IN, inout SurfaceOutput o) {
				o.Albedo = _myColor.rgb;
				o.Emission = _myEmission.rgb;
			}
			/*
			Fields in the SurfaceOutput struct:
			-fixed3 Albedo;		//diffuse color
			-fixed3 Normal;		//tangent space normal
			-fixed3 Emission;
			-half Specular;		//specular power in 0..1 range
			-fixed Gloss;		//specular intensity
			-fixed Alpha;		//alpha for transparencies
			*/

		//EndTag
		ENDCG
	}

	//Fallback for inferior GPUs
	FallBack "Diffuse"
}