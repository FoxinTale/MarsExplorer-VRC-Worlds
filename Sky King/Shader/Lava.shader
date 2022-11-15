Shader "FX/Lava" {
Properties {
	_horizonColor ("Horizon color", COLOR)  = ( .172 , .463 , .435 , 0)
	_WaveScale ("Wave scale", Range (0.02,0.15)) = .07
	_ColorControl ("Reflective color (RGB) fresnel (A) ", 2D) = "" { }
	_ColorControlCube ("Reflective color cube (RGB) fresnel (A) ", Cube) = "" { TexGen CubeReflect }
	_BumpMap ("Waves Bumpmap (RGB) ", 2D) = "" { }
	//WaveSpeed ("Wave speed (map1 x,y; map2 x,y)", Vector) = (19,9,-16,-7)
	_MainTex ("Fallback texture", 2D) = "" { }
}

#LINE 58

	
// -----------------------------------------------------------
// Fragment program

#warning Upgrade NOTE: SubShader commented out because of manual shader assembly
/*Subshader {
	Blend SrcAlpha OneMinusSrcAlpha
	
	Pass {

Program "" {
// Vertex combos: 1
//   opengl - ALU: 15 to 15
//   d3d9 - ALU: 15 to 15
// Fragment combos: 1
//   opengl - ALU: 9 to 9, TEX: 3 to 3
//   d3d9 - ALU: 8 to 8, TEX: 3 to 3
SubProgram "opengl " {
Keywords { }
Bind "vertex", Vertex
Local 1, [_Time]
Local 2, [_ObjectSpaceCameraPos]
Local 3, ([_WaveScale],0,0,0)
"!!ARBvp1.0
# 15 ALU
PARAM c[9] = { { 10, -9, -8 },
		program.local[1..3],
		state.matrix.mvp,
		{ 0.40000001, 0.44999999 } };
TEMP R0;
TEMP R1;
ADD R1.xyz, -vertex.position, c[2];
MOV R0.xyz, c[0];
MAD R0, R0.xxyz, c[1].x, vertex.position.xyxy;
MUL R0, R0, c[3].x;
DP3 R1.w, R1, R1;
MUL result.texcoord[0].xy, R0, c[8];
RSQ R0.x, R1.w;
MUL result.texcoord[2].xyz, R0.x, R1.xzyw;
DP4 R0.x, vertex.position, c[6];
MOV result.texcoord[1].xy, R0.wzzw;
DP4 result.position.w, vertex.position, c[7];
MOV result.position.z, R0.x;
DP4 result.position.y, vertex.position, c[5];
DP4 result.position.x, vertex.position, c[4];
MOV result.fogcoord.x, R0;
END
# 15 instructions, 2 R-regs
"
}

SubProgram "d3d9 " {
Keywords { }
Bind "vertex", Vertex
Local 4, [_Time]
Local 5, [_ObjectSpaceCameraPos]
Local 6, ([_WaveScale],0,0,0)
Matrix 0, [glstate_matrix_mvp]
"vs_1_1
; 15 ALU
def c7, 10.00000000, -9.00000000, -8.00000000, 0
def c8, 0.40000001, 0.44999999, 0, 0
dcl_position v0
add r1.xyz, -v0, c5
mov r0.x, c4
mad r0, c7.xxyz, r0.x, v0.xyxy
mul r0, r0, c6.x
dp3 r1.w, r1, r1
mul oT0.xy, r0, c8
rsq r0.x, r1.w
mul oT2.xyz, r0.x, r1.xzyw
dp4 r0.x, v0, c2
mov oT1.xy, r0.wzzw
dp4 oPos.w, v0, c3
mov oPos.z, r0.x
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
mov oFog, r0.x
"
}

SubProgram "opengl " {
Keywords { }
Local 0, [_horizonColor]
SetTexture [_BumpMap] {2D}
SetTexture [_ColorControl] {2D}
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
OPTION ARB_fog_exp2;
# 9 ALU, 3 TEX
PARAM c[2] = { program.local[0],
		{ 0.60009766, 1 } };
TEMP R0;
TEMP R1;
TEX R1.xyz, fragment.texcoord[1], texture[0], 2D;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
ADD R0.xyz, R0, R1;
ADD R0.xyz, R0, -c[1].y;
DP3 R0.x, fragment.texcoord[2], R0;
MOV result.color.w, c[1].x;
TEX R0, R0.x, texture[1], 2D;
ADD R1.xyz, -R0, c[0];
MAD result.color.xyz, R0.w, R1, R0;
END
# 9 instructions, 2 R-regs
"
}

SubProgram "d3d9 " {
Keywords { }
Local 0, [_horizonColor]
SetTexture [_BumpMap] {2D}
SetTexture [_ColorControl] {2D}
"ps_2_0
; 8 ALU, 3 TEX
dcl_2d s0
dcl_2d s1
def c1, -1.00000000, 0.60009766, 0, 0
dcl t0.xy
dcl t1.xy
dcl t2.xyz
texld r0, t1, s0
texld r1, t0, s0
add_pp r0.xyz, r1, r0
add_pp r0.xyz, r0, c1.x
dp3 r0.x, t2, r0
mov r0.xy, r0.x
texld r0, r0, s1
add_pp r1.xyz, -r0, c0
mad_pp r0.xyz, r0.w, r1, r0
mov_pp r0.w, c1.y
mov_pp oC0, r0
"
}

}
#LINE 91

	}
}*/

// -----------------------------------------------------------
// Radeon 9000

#warning Upgrade NOTE: SubShader commented out because of manual shader assembly
/*Subshader {
	Pass {
Program "" {
// Vertex combos: 1
//   opengl - ALU: 15 to 15
//   d3d9 - ALU: 15 to 15
SubProgram "opengl " {
Keywords { }
Bind "vertex", Vertex
Local 1, [_Time]
Local 2, [_ObjectSpaceCameraPos]
Local 3, ([_WaveScale],0,0,0)
"!!ARBvp1.0
# 15 ALU
PARAM c[9] = { { 10, -9, -8 },
		program.local[1..3],
		state.matrix.mvp,
		{ 0.40000001, 0.44999999 } };
TEMP R0;
TEMP R1;
ADD R1.xyz, -vertex.position, c[2];
MOV R0.xyz, c[0];
MAD R0, R0.xxyz, c[1].x, vertex.position.xyxy;
MUL R0, R0, c[3].x;
DP3 R1.w, R1, R1;
MUL result.texcoord[0].xy, R0, c[8];
RSQ R0.x, R1.w;
MUL result.texcoord[2].xyz, R0.x, R1.xzyw;
DP4 R0.x, vertex.position, c[6];
MOV result.texcoord[1].xy, R0.wzzw;
DP4 result.position.w, vertex.position, c[7];
MOV result.position.z, R0.x;
DP4 result.position.y, vertex.position, c[5];
DP4 result.position.x, vertex.position, c[4];
MOV result.fogcoord.x, R0;
END
# 15 instructions, 2 R-regs
"
}

SubProgram "d3d9 " {
Keywords { }
Bind "vertex", Vertex
Local 4, [_Time]
Local 5, [_ObjectSpaceCameraPos]
Local 6, ([_WaveScale],0,0,0)
Matrix 0, [glstate_matrix_mvp]
"vs_1_1
; 15 ALU
def c7, 10.00000000, -9.00000000, -8.00000000, 0
def c8, 0.40000001, 0.44999999, 0, 0
dcl_position v0
add r1.xyz, -v0, c5
mov r0.x, c4
mad r0, c7.xxyz, r0.x, v0.xyxy
mul r0, r0, c6.x
dp3 r1.w, r1, r1
mul oT0.xy, r0, c8
rsq r0.x, r1.w
mul oT2.xyz, r0.x, r1.xzyw
dp4 r0.x, v0, c2
mov oT1.xy, r0.wzzw
dp4 oPos.w, v0, c3
mov oPos.z, r0.x
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
mov oFog, r0.x
"
}

}
#LINE 104


		Program "" {
			SubProgram {
				Local 0, [_horizonColor]

"!!ATIfs1.0
StartConstants;
	CONSTANT c0 = program.local[0];
EndConstants;

StartPrelimPass;
	SampleMap r0, t0.str;
	SampleMap r1, t1.str;
	PassTexCoord r2, t2.str;
	
	ADD r1, r0.bias, r1.bias;	# bump = bump1 + bump2 - 1
	DOT3 r2, r1, r2;			# fresnel: dot (bump, viewer-pos)
EndPass;

StartOutputPass;
 	SampleMap r2, r2.str;

	LERP r0.rgb, r2.a, c0, r2;	# fade in reflection
	MOV r0.a, c0.a;
EndPass;
"
#LINE 130
 
}
}
		SetTexture [_BumpMap] {}
		SetTexture [_BumpMap] {}
		SetTexture [_ColorControl] {}
	}
}*/

// -----------------------------------------------------------
//  Old cards

// three texture, cubemaps
Subshader {
	Pass {
		Color (0.5,0.5,0.5,0.5)
		SetTexture [_MainTex] {
			Matrix [_WaveMatrix]
			combine texture * primary
		}
		SetTexture [_MainTex] {
			Matrix [_WaveMatrix2]
			combine texture * primary + previous
		}
		SetTexture [_ColorControlCube] {
			combine texture +- previous, primary
			Matrix [_Reflection]
		}
	}
}

// dual texture, cubemaps
Subshader {
	Pass {
		Color (0.5,0.5,0.5,0.5)
		SetTexture [_MainTex] {
			Matrix [_WaveMatrix]
			combine texture
		}
		SetTexture [_ColorControlCube] {
			combine texture +- previous, primary
			Matrix [_Reflection]
		}
	}
}

// single texture
Subshader {
	Pass {
		Color (0.5,0.5,0.5,0)
		SetTexture [_MainTex] {
			Matrix [_WaveMatrix]
			combine texture, primary
		}
	}
}

}
