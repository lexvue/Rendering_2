Shader "Custom/MyFirstShader" {
    // Can use these to group multiple shader variants together
    SubShader { 
        // Must contain at least one Pass, this is where an object actually gets rendered
        // Having more than one Pass means that the object gets rendered multiple times -> good for a lot of effects

        Pass {
            CGPROGRAM  // Start of Unity Shading Language. Have to start with CGPROGRAM 

            #pragma vertex MyVertexProgram // For Mesh Vertices and Transformation Matrix (vertex data of a mesh, object space -> display space)
            #pragma fragment MyFragmentProgram // For Transformed vertices from MyVertexProgram and Mesh Triangles (coloring pixels in a mesh's triangle)

            #include "UnityCG.cginc" // UnityCG -> UnityInstancing -> UnityShaderVariables -> HLSLSupport

            float4 MyVertexProgram(float4 position : POSITION) : SV_POSITION { // SV = System Value, POSITION = final vertex position
                return position;
            }

            float4 MyFragmentProgram(
                float4 position : SV_POSITION
            ) : SV_TARGET { // Outputs an RGBA color val for one pixel //SV_TARGET = frame buffer
                return float4(0, 0, 0, 0); // Alpha val gets ignored by the shader because there is no support for transparency written here yet, so 0 here doesn't affect it
            }

            ENDCG // Terminate code with ENDCG
        }
    }
}