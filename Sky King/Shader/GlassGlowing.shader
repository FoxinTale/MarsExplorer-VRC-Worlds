Shader "Transparent/GlassGlowing" {
Properties {
	_Color ("Main Color", Color) = (1,1,1,1)
	_FColor ("Fallback Color", Color) = (1,1,1,1)
	_SpecColor ("Specular Color", Color) = (0.5,0.5,0.5,1)
	_Cube ("Reflection Cubemap", Cube) = "_Skybox" {TexGen CubeNormal}
}

Category {
	Tags {Queue=Transparent}
	ZWrite Off
	Blend SrcAlpha OneMinusSrcAlpha
	Lighting Off
	Colormask RGB

	#warning Upgrade NOTE: SubShader commented out because of manual shader assembly
/*SubShader {
		Pass {
			
Program "" {
// Vertex combos: 1
//   opengl - ALU: 13 to 13
//   d3d9 - ALU: 13 to 13
// Fragment combos: 1
//   opengl - ALU: 13 to 13, TEX: 1 to 1
//   d3d9 - ALU: 13 to 13, TEX: 1 to 1
SubProgram "opengl " {
Keywords { }
Bind "vertex", Vertex
Bind "normal", Normal
Local 5, [_ObjectSpaceCameraPos]
Matrix 1, [_Object2World]
"!!ARBvp1.0
# 13 ALU
PARAM c[10] = { program.local[0..5],
		state.matrix.mvp };
TEMP R0;
ADD R0.xyz, -vertex.position, c[5];
DP3 result.texcoord[1].z, R0, c[3];
DP3 result.texcoord[1].y, R0, c[2];
DP3 result.texcoord[1].x, R0, c[1];
DP4 R0.x, vertex.position, c[8];
DP4 result.position.w, vertex.position, c[9];
MOV result.position.z, R0.x;
DP4 result.position.y, vertex.position, c[7];
DP4 result.position.x, vertex.position, c[6];
MOV result.fogcoord.x, R0;
DP3 result.texcoord[0].z, vertex.normal, c[3];
DP3 result.texcoord[0].y, vertex.normal, c[2];
DP3 result.texcoord[0].x, vertex.normal, c[1];
END
# 13 instructions, 1 R-regs
"
}

SubProgram "d3d9 " {
Keywords { }
Bind "vertex", Vertex
Bind "normal", Normal
Local 8, [_ObjectSpaceCameraPos]
Matrix 0, [_Object2World]
Matrix 4, [glstate_matrix_mvp]
"vs_1_1
; 13 ALU
dcl_position v0
dcl_normal v1
add r0.xyz, -v0, c8
dp3 oT1.z, r0, c2
dp3 oT1.y, r0, c1
dp3 oT1.x, r0, c0
dp4 r0.x, v0, c6
dp4 oPos.w, v0, c7
mov oPos.z, r0.x
dp4 oPos.y, v0, c5
dp4 oPos.x, v0, c4
mov oFog, r0.x
dp3 oT0.z, v1, c2
dp3 oT0.y, v1, c1
dp3 oT0.x, v1, c0
"
}

SubProgram "opengl " {
Keywords { }
Local 0, [_Color]
Local 1, [_SpecColor]
SetTexture [_Cube] {CUBE}
"!!ARBfp1.0
OPTION ARB_fog_exp2;
OPTION ARB_precision_hint_fastest;
# 13 ALU, 1 TEX
PARAM c[3] = { program.local[0..1],
		{ 0.89999998, 2, 0.89990234, 0.5 } };
TEMP R0;
TEMP R1;
DP3 R0.x, fragment.texcoord[1], fragment.texcoord[1];
RSQ R0.x, R0.x;
MUL R1.xyz, R0.x, fragment.texcoord[1];
DP3 R0.x, fragment.texcoord[0], -R1;
MUL R0.xyz, fragment.texcoord[0], R0.x;
MAD R0.xyz, -R0, c[2].y, -R1;
DP3_SAT R0.w, fragment.texcoord[0], R1;
MAD result.color.w, -R0, c[2], c[2].z;
TEX R0.xyz, R0, texture[0], CUBE;
ADD R0.xyz, R0, c[1];
ADD R0.xyz, R0, -c[0];
MUL R0.xyz, R0, c[2].x;
ADD result.color.xyz, R0, c[0];
END
# 13 instructions, 2 R-regs
"
}

SubProgram "d3d9 " {
Keywords { }
Local 0, [_Color]
Local 1, [_SpecColor]
SetTexture [_Cube] {CUBE}
"ps_2_0
; 13 ALU, 1 TEX
dcl_cube s0
def c2, 2.00000000, 0.89999998, 0.50000000, 0.89990234
dcl t0.xyz
dcl t1.xyz
dp3 r0.x, t1, t1
rsq r0.x, r0.x
mul r0.xyz, r0.x, t1
dp3 r1.x, t0, -r0
mul r1.xyz, t0, r1.x
mad r1.xyz, -r1, c2.x, -r0
dp3_sat r0.x, t0, r0
mad_pp r0.w, -r0.x, c2.z, c2
texld r1, r1, s0
add r1.xyz, r1, c1
add r1.xyz, r1, -c0
mul r1.xyz, r1, c2.y
add r0.xyz, r1, c0
mov_pp oC0, r0
"
}

}
#LINE 63
  
			SetTexture [_Cube] {combine texture}
		}
	}*/
	
	SubShader {
		Pass {
			Color [_FColor]
		}
	}
	
	
}

}
