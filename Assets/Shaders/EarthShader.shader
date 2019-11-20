Shader "Custom/EarthShader"
{
    Properties
    {
        _MainTex1 ("Albedo (RGB)", 2D) = "white" {}
        _MainTex2 ("Alebedo (RGB", 2D) = "white" {}
        _TexValue ("Texture Value", Range(0,1)) =0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows
        #pragma target 3.0

        sampler2D _MainTex1;
        sampler2D _MainTex2;
        float _TexValue;

        struct Input
        {
            float2 uv_MainTex1;
            float2 uv_MainTex2;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            // Albedo comes from a texture tinted by color
            fixed4 c = tex2D (_MainTex1, IN.uv_MainTex1);
            fixed4 d = tex2D (_MainTex2, IN.uv_MainTex1);
            o.Albedo = lerp(c.rgb, d.rgb, _TexValue);
            o.Alpha = lerp(c.a, d.a, _TexValue);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
