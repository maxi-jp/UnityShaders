Shader "Holistic/PropChallenge4" 
{
    Properties {
        _myTex ("Texture", 2D) = "white" {}
        _emissiveTex("Emissive texture", 2D) = "black" {}

        _emissivePower("Emissive power", Float) = 1.0
    }
    SubShader {

      CGPROGRAM
        #pragma surface surf Lambert
        
        sampler2D _myTex;
        sampler2D _emissiveTex;
        float _emissivePower;

        struct Input {
            float2 uv_myTex;
            float2 uv_emissiveTex;
        };
        
        void surf (Input IN, inout SurfaceOutput o) {
            o.Albedo = (tex2D(_myTex, IN.uv_myTex)).rgb;
            o.Emission = (tex2D(_emissiveTex, IN.uv_emissiveTex) * _emissivePower).rgb;
        }
      
      ENDCG
    }
    Fallback "Diffuse"
}
