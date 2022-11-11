#include"Particle.hlsli"



//struct GSOutput
//{
//	float4 pos : SV_POSITION;
//};

//�l�p�`�̒��_��
static const uint vnum = 4;

//�Z���^�[����̃I�t�Z�b�g
static const float4 offset_array[vnum] =
{
	float4(-0.25f,-0.25f,0,0),//����
	float4(-0.25f,+0.25f,0,0),//����
	float4(+0.25f,-0.25f,0,0),//�E��
	float4(+0.25f,+0.25f,0,0),//�E��
};

static const float2 uv_array[vnum] =
{
	float2(0,1),//����
	float2(0,0),//����
	float2(1,1),//�E��
	float2(1,0),//�E��
};//

//�_�̓��͂���,�l�p�`���o��
[maxvertexcount(vnum)]
void main(
	point VSOutput input[1] : SV_POSITION,
	inout TriangleStream< GSOutput > output
)
{
	GSOutput element;
	//4�_���܂킷
	for (uint i = 0; i < vnum; i++) {
		//���S����̃I�t�Z�b�g���r���{�[�h��]
		float4 offset = mul(matBillboard, offset_array[i]);
		//���[���h���W�x�[�X��,���炷
		element.svpos = input[0].pos+offset;
		//element.uv = float2(0.5f, 0.5f);
		//�r���[�v���W�F�N�V�����ϊ�
		element.svpos = mul(mat, element.svpos);
		element.uv = uv_array[i];
		output.Append(element);
	}
}



