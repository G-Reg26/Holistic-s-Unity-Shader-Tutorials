Shader "Holistic/PackedPractice" {
	Properties{
		_myColor("Example Color", Color) = (1, 1, 1, 1)
	}

	SubShader{
		CGPROGRAM
		#pragma surface surf Lambert

		struct Input {
			float2 uvMainText;
		};

		fixed4 _myColor;

		void surf(Input IN, inout SurfaceOutput o) {
			o.Albedo.r = _myColor.r;
		}

		ENDCG
	}
	
	FallBack "Diffuse"
}

/*
Variables and Packed Arrays:
	Basic Shader Data Types:
	-Float:
		-Highest precision, 32 bits like a C# float
		-Used for wolrd positions, texture coordinates and calculations
	-Half:
		-Half sized float, 16 bits
		-Used for short vectors, directions and dynamic color ranges
	-Fixed:
		-Lowest precision, 11 bits
		-Used for regular colors and simple color operations
	-Int:
		-Used for counters and array indicies

	Texture Data Types:
	-sample2D:
		-Regular flat images
		-sampler2D_half for low precision
		-sampler2D_float for high precision
	-samplerCUBE:
		-For cube maps
		-samplerCUBE_half for low precision
		-samplerCUBE_float for high precision
	
	Packed Arrays:
		-Any of these data types can be made into arrays
		-(Data Type)(Number representing the length of the array)
			-int2
			-float4
			-fixed3
		-To set values to an array:
			-fixed4 color1 = (0, 1, 1, 0);
			-fixed4 color2 = (0, 1, 1, 0);
		-To access a value from an array use rgba or xyzw:
			-color1.x will return 0
			-color1.b will return 1
		-To set a smaller array with a larger array:
			-fixed3 color3;
			-color3 = color1.rgb;
	
	Packed Matricies:
		-(Data Type)(Number of rows)x(Number of columns)
		-To access values:
			-float myValue = matrix._m00;
			-index notation is _mRC (_m00)
		-int3x3 matrix:
			-[_m20] [_m21] [_m22]
			-[_m10] [_m11] [_m12]
			-[_m00] [_m01] [_m02]
*/
