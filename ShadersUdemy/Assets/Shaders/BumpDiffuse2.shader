Shader "Holistic/BumpDiffuse2" 
{
    Properties {
        _myDiffuse ("Diffuse Texture", 2D) = "white" {}
        _myBump("Normal Texture", 2D) = "bump" {}
        _bumpSlider("Bump Amount", Range(0,10)) = 1
    }
    SubShader {

      CGPROGRAM
        #pragma surface surf Lambert
        
        sampler2D _myDiffuse;
        sampler2D _myBump;
        half _bumpSlider;

        struct Input {
            float2 uv_myDiffuse;
            float2 uv_myBump;
        };
        
        void surf (Input IN, inout SurfaceOutput o) {
            o.Albedo = (tex2D(_myDiffuse, IN.uv_myDiffuse)).rgb;
            o.Normal = UnpackNormal(tex2D(_myBump, IN.uv_myBump)) *
                float3(_bumpSlider, _bumpSlider, 1.0f);
        }
      
      ENDCG
    }
    Fallback "Diffuse"
}
