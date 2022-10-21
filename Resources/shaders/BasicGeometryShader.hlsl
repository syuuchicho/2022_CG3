#include"BasicShaderHeader.hlsli"



//struct GSOutput
//{
//	float4 pos : SV_POSITION;
//};

[maxvertexcount(6)]
void main(
	triangle VSOutput input[3] : SV_POSITION,
	inout TriangleStream< GSOutput > output
)
{
	//1つ目の三角形
	for (uint i = 0; i < 3; i++)
	{
		GSOutput element;
		element.svpos = input[i].svpos;
		element.normal = input[i].normal;
		element.uv = input[i].uv;
		output.Append(element);
	}
	//現在のストリップ終了
	output.RestartStrip();
	//2つ目の三角形
	for (uint i = 0; i < 3; i++)
	{
		GSOutput element;
		//X方向に20ずらす
		element.svpos = input[i].svpos + float4(20.0f, 0.0f, 0.0f, 0.0f);
		element.normal = input[i].normal;
		//UVを5倍に
		element.uv = input[i].uv*5.0f;
		output.Append(element);
	}
}



