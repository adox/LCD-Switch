//POVRay-File created by 3d41.ulp v20110101
//C:/Projekty/LCD Switch/sch/main.brd
//2012-07-04 11:59:18

#version 3.5;

//Set to on if the file should be used as .inc
#local use_file_as_inc = off;
#if(use_file_as_inc=off)


//changes the apperance of resistors (1 Blob / 0 real)
#declare global_res_shape = 1;
//randomize color of resistors 1=random 0=same color
#declare global_res_colselect = 0;
//Number of the color for the resistors
//0=Green, 1="normal color" 2=Blue 3=Brown
#declare global_res_col = 1;
//Set to on if you want to render the PCB upside-down
#declare pcb_upsidedown = off;
//Set to x or z to rotate around the corresponding axis (referring to pcb_upsidedown)
#declare pcb_rotdir = x;
//Set the length off short pins over the PCB
#declare pin_length = 2.5;
#declare global_diode_bend_radius = 1;
#declare global_res_bend_radius = 1;
#declare global_solder = on;

#declare global_show_screws = on;
#declare global_show_washers = on;
#declare global_show_nuts = on;

#declare global_use_radiosity = on;

#declare global_ambient_mul = 1;
#declare global_ambient_mul_emit = 0;

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 2;
#declare pin_short = on;

#declare e3d_environment = off;

#local cam_x = 0;
#local cam_y = 365;
#local cam_z = -116;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -5;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 0;
#local pcb_rotate_z = 0;

#local pcb_board = on;
#local pcb_parts = on;
#local pcb_wire_bridges = off;
#if(global_fast_mode=off)
	#local pcb_polygons = on;
	#local pcb_silkscreen = on;
	#local pcb_wires = on;
	#local pcb_pads_smds = on;
#else
	#local pcb_polygons = off;
	#local pcb_silkscreen = off;
	#local pcb_wires = off;
	#local pcb_pads_smds = off;
#end

#local lgt1_pos_x = 43;
#local lgt1_pos_y = 65;
#local lgt1_pos_z = 26;
#local lgt1_intense = 0.782933;
#local lgt2_pos_x = -43;
#local lgt2_pos_y = 65;
#local lgt2_pos_z = 26;
#local lgt2_intense = 0.782933;
#local lgt3_pos_x = 43;
#local lgt3_pos_y = 65;
#local lgt3_pos_z = -18;
#local lgt3_intense = 0.782933;
#local lgt4_pos_x = -43;
#local lgt4_pos_y = 65;
#local lgt4_pos_z = -18;
#local lgt4_intense = 0.782933;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 114.300200;
#declare pcb_y_size = 50.790000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(1017);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	1.535000,
}
#declare global_pcb_real_hole = 2.000000;

#include "e3d_tools.inc"
#include "e3d_user.inc"

global_settings{charset utf8}

#if(e3d_environment=on)
sky_sphere {pigment {Navy}
pigment {bozo turbulence 0.65 octaves 7 omega 0.7 lambda 2
color_map {
[0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
[0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
[0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]}
scale <0.1, 0.5, 0.1>} rotate -90*x}
plane{y, -10.0-max(pcb_x_size,pcb_y_size)*abs(max(sin((pcb_rotate_x/180)*pi),sin((pcb_rotate_z/180)*pi)))
texture{T_Chrome_2D
normal{waves 0.1 frequency 3000.0 scale 3000.0}} translate<0,0,0>}
#end

//Animation data
#if(global_anim=on)
#declare global_anim_showcampath = no;
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_flight=0;
#warning "No/not enough Animation Data available (min. 3 points) (Flight path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_view=0;
#warning "No/not enough Animation Data available (min. 3 points) (View path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#end

#if((global_anim_showcampath=yes)&(global_anim=off))
#end
#if(global_anim=on)
camera
{
	location global_anim_spline_cam_flight(clock)
	#if(global_anim_npoints_cam_view>2)
		look_at global_anim_spline_cam_view(clock)
	#else
		look_at global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	angle 45
}
light_source
{
	global_anim_spline_cam_flight(clock)
	color rgb <1,1,1>
	spotlight point_at 
	#if(global_anim_npoints_cam_view>2)
		global_anim_spline_cam_view(clock)
	#else
		global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	radius 35 falloff  40
}
#else
camera
{
	location <cam_x,cam_y,cam_z>
	look_at <cam_look_x,cam_look_y,cam_look_z>
	angle cam_a
	//translates the camera that <0,0,0> is over the Eagle <0,0>
	//translate<-57.150100,0,-25.395000>
}
#end

background{col_bgr}
light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro MAIN(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<-1.270000,0.000000><113.030200,0.000000>
<113.030200,0.000000><113.030200,50.790000>
<113.030200,50.790000><-1.270000,50.790000>
<-1.270000,50.790000><-1.270000,0.000000>
texture{col_brd}}
}//End union(PCB)
//Holes(real)/Parts
cylinder{<12.192000,1,39.878000><12.192000,-5,39.878000>1.250000 texture{col_hls}}
cylinder{<12.192000,1,8.890000><12.192000,-5,8.890000>1.250000 texture{col_hls}}
cylinder{<87.122000,1,8.890000><87.122000,-5,8.890000>1.250000 texture{col_hls}}
cylinder{<87.122000,1,39.878000><87.122000,-5,39.878000>1.250000 texture{col_hls}}
cylinder{<69.646800,1,44.450000><69.646800,-5,44.450000>1.524000 texture{col_hls}}
cylinder{<44.653200,1,44.450000><44.653200,-5,44.450000>1.524000 texture{col_hls}}
//Holes(real)/Board
cylinder{<2.540000,1,3.810000><2.540000,-5,3.810000>1.600000 texture{col_hls}}
cylinder{<109.220000,1,3.810000><109.220000,-5,3.810000>1.600000 texture{col_hls}}
cylinder{<109.220000,1,46.990000><109.220000,-5,46.990000>1.600000 texture{col_hls}}
cylinder{<2.540000,1,46.990000><2.540000,-5,46.990000>1.600000 texture{col_hls}}
//Holes(real)/Vias
cylinder{<3.810000,0.095000,9.956800><3.810000,-1.595000,9.956800>1.003300 texture{col_hls}}
cylinder{<3.810000,0.095000,13.970000><3.810000,-1.595000,13.970000>1.003300 texture{col_hls}}
cylinder{<3.810000,0.095000,17.983200><3.810000,-1.595000,17.983200>1.003300 texture{col_hls}}
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_DIS_CERAMIC_50MM_76MM("100n",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<49.530000,0.000000,31.750000>}#end		//ceramic disc capacitator C1 100n C050-025X075
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_DIS_CERAMIC_50MM_76MM("100n",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<29.210000,0.000000,22.860000>}#end		//ceramic disc capacitator C2 100n C050-025X075
#ifndef(pack_D1) #declare global_pack_D1=yes; object {DIODE_DIS_DO35_076MM_H("1N4148",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<76.200000,0.000000,44.450000>}#end		//Diode DO35 7mm hor. D1 1N4148 DO35-7
#ifndef(pack_D2) #declare global_pack_D2=yes; object {DIODE_DIS_DO35_076MM_H("1N4148",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<39.370000,0.000000,44.450000>}#end		//Diode DO35 7mm hor. D2 1N4148 DO35-7
#ifndef(pack_D3) #declare global_pack_D3=yes; object {DIODE_DIS_DO41_102MM_H("1N4004",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<30.480000,0.000000,36.830000>}#end		//Diode DO35 10mm hor. D3 1N4004 DO41-10
#ifndef(pack_D4) #declare global_pack_D4=yes; object {DIODE_DIS_DO35_076MM_H("1N4148",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<78.740000,0.000000,44.450000>}#end		//Diode DO35 7mm hor. D4 1N4148 DO35-7
#ifndef(pack_IC1) #declare global_pack_IC1=yes; object {TR_TO220_3_V("",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<30.480000,-1.500000,26.670000>}#end		//TO220 vertical straight leads IC1  78XXS
#ifndef(pack_IC2) #declare global_pack_IC2=yes; object {IC_DIS_DIP18("PIC16F628P","MICROCHIP",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<53.340000,0.000000,19.050000>translate<0,3.000000,0> }#end		//DIP18 IC2 PIC16F628P DIL18
#ifndef(pack_IC2) object{SOCKET_DIP18()rotate<0,0.000000,0> rotate<0,0,0> translate<53.340000,0.000000,19.050000>}#end					//IC-Sockel 18Pin IC2 PIC16F628P
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_DIS_0207_10MM(texture{pigment{Yellow}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Violet*1.2}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<73.660000,0.000000,25.400000>}#end		//Discrete Resistor 0,3W 10MM Grid R2 4k7 0207/10
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_DIS_0207_10MM(texture{pigment{Yellow}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Violet*1.2}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<59.690000,0.000000,27.940000>}#end		//Discrete Resistor 0,3W 10MM Grid R3 4k7 0207/10
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_DIS_0207_10MM(texture{pigment{Yellow}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Violet*1.2}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<64.770000,0.000000,30.480000>}#end		//Discrete Resistor 0,3W 10MM Grid R4 4k7 0207/10
#ifndef(pack_S1) #declare global_pack_S1=yes; object {SWITCH_B3F_10XX1()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<97.790000,0.000000,40.640000>}#end		//Tactile Switch-Omron S1  B3F-10XX
#ifndef(pack_S2) #declare global_pack_S2=yes; object {SWITCH_B3F_10XX1()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<97.790000,0.000000,25.400000>}#end		//Tactile Switch-Omron S2  B3F-10XX
#ifndef(pack_S3) #declare global_pack_S3=yes; object {SWITCH_B3F_10XX1()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<97.790000,0.000000,10.160000>}#end		//Tactile Switch-Omron S3  B3F-10XX
#ifndef(pack_T1) #declare global_pack_T1=yes; object {TR_TO92_L("BC337",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<73.660000,0.000000,35.560000>}#end		//TO92 straight vertical T1 BC337 TO92-CBE
#ifndef(pack_T2) #declare global_pack_T2=yes; object {TR_TO92_L("BC337",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<55.880000,0.000000,35.560000>}#end		//TO92 straight vertical T2 BC337 TO92-CBE
#ifndef(pack_T3) #declare global_pack_T3=yes; object {TR_TO92_L("BC337",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<66.040000,0.000000,35.560000>}#end		//TO92 straight vertical T3 BC337 TO92-CBE
#ifndef(pack_U1) #declare global_pack_U1=yes; object {USER_LCD_16X2()translate<0,10,30> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<17.780000,0.000000,8.890000>}#end		//0 U1 LCD_BL_16X2_LOW LCD_BL_16X2_LOW
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<49.530000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<49.530000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<26.670000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<31.750000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<39.370000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<41.910000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<76.200000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<76.200000,0,48.260000> texture{col_thl}}
#ifndef(global_pack_D2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<39.370000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_D2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<39.370000,0,48.260000> texture{col_thl}}
#ifndef(global_pack_D3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<35.560000,0,36.830000> texture{col_thl}}
#ifndef(global_pack_D3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<25.400000,0,36.830000> texture{col_thl}}
#ifndef(global_pack_D4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<78.740000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_D4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<78.740000,0,48.260000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<30.480000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<27.940000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<33.020000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<43.180000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<45.720000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<48.260000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<50.800000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<53.340000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<55.880000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<58.420000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<60.960000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<63.500000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<63.500000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<60.960000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<58.420000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<55.880000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<53.340000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<50.800000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<48.260000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<45.720000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<43.180000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<74.930000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<80.010000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<77.470000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<73.660000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<73.660000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<64.770000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<54.610000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<59.690000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<69.850000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_S1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<94.538800,0,42.900600> texture{col_thl}}
#ifndef(global_pack_S1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<101.041200,0,42.900600> texture{col_thl}}
#ifndef(global_pack_S1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<94.538800,0,38.379400> texture{col_thl}}
#ifndef(global_pack_S1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<101.041200,0,38.379400> texture{col_thl}}
#ifndef(global_pack_S2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<94.538800,0,27.660600> texture{col_thl}}
#ifndef(global_pack_S2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<101.041200,0,27.660600> texture{col_thl}}
#ifndef(global_pack_S2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<94.538800,0,23.139400> texture{col_thl}}
#ifndef(global_pack_S2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<101.041200,0,23.139400> texture{col_thl}}
#ifndef(global_pack_S3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<94.538800,0,12.420600> texture{col_thl}}
#ifndef(global_pack_S3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<101.041200,0,12.420600> texture{col_thl}}
#ifndef(global_pack_S3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<94.538800,0,7.899400> texture{col_thl}}
#ifndef(global_pack_S3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<101.041200,0,7.899400> texture{col_thl}}
#ifndef(global_pack_S4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(3.009900,2.006600,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<3.810000,0,17.983200> texture{col_thl}}
#ifndef(global_pack_S4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(3.009900,2.006600,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<3.810000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_S4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(3.009900,2.006600,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<3.810000,0,9.956800> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<73.660000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<71.120000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<76.200000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_T2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<55.880000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_T2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<53.340000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_T2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<58.420000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_T3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<66.040000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_T3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<63.500000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_T3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<68.580000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.400000,0.800000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<27.760000,0,46.520000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.400000,0.800000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<27.760000,0,44.920000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<25.060000,0,40.120000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<23.460000,0,40.120000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<22.260000,0,42.920000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<20.660000,0,42.920000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<50.800000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<48.260000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<45.720000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<43.180000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<40.640000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<38.100000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<35.560000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<33.020000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<30.480000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<27.940000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<25.400000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<22.860000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<20.320000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<17.780000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<53.340000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<55.880000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.638300,1.092200,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<62.687200,0,45.872400> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.638300,1.092200,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<59.918600,0,45.872400> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.638300,1.092200,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<57.150000,0,45.872400> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.638300,1.092200,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<54.381400,0,45.872400> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.638300,1.092200,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<51.612800,0,45.872400> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.638300,1.092200,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<61.302900,0,43.027600> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.638300,1.092200,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<58.534300,0,43.027600> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.638300,1.092200,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<55.765700,0,43.027600> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.638300,1.092200,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<52.997100,0,43.027600> texture{col_thl}}
//Pads/Vias
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,1,0) translate<66.475000,0,17.041000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,1,0) translate<30.466500,0,36.921600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.206400,0.800000,1,16,1,0) translate<36.830000,0,11.430000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,1,0) translate<39.396100,0,16.699700> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,1,0) translate<42.137200,0,12.358600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,1,0) translate<59.464800,0,25.715200> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<3.810000,-1.535000,9.956800>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<7.720100,-1.535000,9.956800>}
box{<0,0,-0.400000><3.910100,0.035000,0.400000> rotate<0,0.000000,0> translate<3.810000,-1.535000,9.956800> }
}cylinder{<3.810000,1,9.956800><3.810000,-2.500000,9.956800>1.003300 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<3.810000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<4.787600,-1.535000,13.970000>}
box{<0,0,-0.400000><0.977600,0.035000,0.400000> rotate<0,0.000000,0> translate<3.810000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<4.787600,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<14.484200,-1.535000,23.666600>}
box{<0,0,-0.400000><13.713063,0.035000,0.400000> rotate<0,-44.997030,0> translate<4.787600,-1.535000,13.970000> }
}cylinder{<3.810000,1,13.970000><3.810000,-2.500000,13.970000>1.003300 texture{col_thl}}}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<7.720100,-1.535000,9.956800>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<7.720100,-1.535000,13.976300>}
box{<0,0,-0.400000><4.019500,0.035000,0.400000> rotate<0,90.000000,0> translate<7.720100,-1.535000,13.976300> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<9.914900,-1.535000,7.971800>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<9.914900,-1.535000,14.332400>}
box{<0,0,-0.400000><6.360600,0.035000,0.400000> rotate<0,90.000000,0> translate<9.914900,-1.535000,14.332400> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<9.914900,-1.535000,7.971800>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<13.805000,-1.535000,4.081700>}
box{<0,0,-0.400000><5.501432,0.035000,0.400000> rotate<0,44.997030,0> translate<9.914900,-1.535000,7.971800> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<14.484200,-1.535000,39.605700>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<14.484200,-1.535000,23.666600>}
box{<0,0,-0.400000><15.939100,0.035000,0.400000> rotate<0,-90.000000,0> translate<14.484200,-1.535000,23.666600> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<14.894300,-1.535000,7.035600>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<14.894300,-1.535000,10.817900>}
box{<0,0,-0.400000><3.782300,0.035000,0.400000> rotate<0,90.000000,0> translate<14.894300,-1.535000,10.817900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<16.194400,-1.535000,7.574100>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<16.194400,-1.535000,10.180700>}
box{<0,0,-0.400000><2.606600,0.035000,0.400000> rotate<0,90.000000,0> translate<16.194400,-1.535000,10.180700> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<14.894300,-1.535000,7.035600>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<16.548100,-1.535000,5.381800>}
box{<0,0,-0.400000><2.338826,0.035000,0.400000> rotate<0,44.997030,0> translate<14.894300,-1.535000,7.035600> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<16.194400,-1.535000,7.574100>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<17.086600,-1.535000,6.681900>}
box{<0,0,-0.400000><1.261761,0.035000,0.400000> rotate<0,44.997030,0> translate<16.194400,-1.535000,7.574100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<17.780000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<17.780000,-1.535000,9.261700>}
box{<0,0,-0.400000><0.371700,0.035000,0.400000> rotate<0,90.000000,0> translate<17.780000,-1.535000,9.261700> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<20.320000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<20.320000,-1.535000,9.236200>}
box{<0,0,-0.400000><0.346200,0.035000,0.400000> rotate<0,90.000000,0> translate<20.320000,-1.535000,9.236200> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<14.484200,-1.535000,39.605700>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<21.903600,-1.535000,47.025100>}
box{<0,0,-0.400000><10.492616,0.035000,0.400000> rotate<0,-44.997030,0> translate<14.484200,-1.535000,39.605700> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<17.086600,-1.535000,6.681900>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<22.860000,-1.535000,6.681900>}
box{<0,0,-0.400000><5.773400,0.035000,0.400000> rotate<0,0.000000,0> translate<17.086600,-1.535000,6.681900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<22.860000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<22.860000,-1.535000,6.681900>}
box{<0,0,-0.400000><2.208100,0.035000,0.400000> rotate<0,-90.000000,0> translate<22.860000,-1.535000,6.681900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<17.780000,-1.535000,9.261700>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<23.626100,-1.535000,15.107800>}
box{<0,0,-0.400000><8.267634,0.035000,0.400000> rotate<0,-44.997030,0> translate<17.780000,-1.535000,9.261700> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<16.548100,-1.535000,5.381800>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<24.099900,-1.535000,5.381800>}
box{<0,0,-0.400000><7.551800,0.035000,0.400000> rotate<0,0.000000,0> translate<16.548100,-1.535000,5.381800> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<14.894300,-1.535000,10.817900>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<24.237600,-1.535000,20.161200>}
box{<0,0,-0.400000><13.213422,0.035000,0.400000> rotate<0,-44.997030,0> translate<14.894300,-1.535000,10.817900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<20.320000,-1.535000,9.236200>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<24.854000,-1.535000,13.770200>}
box{<0,0,-0.400000><6.412044,0.035000,0.400000> rotate<0,-44.997030,0> translate<20.320000,-1.535000,9.236200> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<16.194400,-1.535000,10.180700>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<24.874800,-1.535000,18.861100>}
box{<0,0,-0.400000><12.275939,0.035000,0.400000> rotate<0,-44.997030,0> translate<16.194400,-1.535000,10.180700> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<24.099900,-1.535000,5.381800>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<25.400000,-1.535000,6.681900>}
box{<0,0,-0.400000><1.838619,0.035000,0.400000> rotate<0,-44.997030,0> translate<24.099900,-1.535000,5.381800> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<25.400000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<25.400000,-1.535000,6.681900>}
box{<0,0,-0.400000><2.208100,0.035000,0.400000> rotate<0,-90.000000,0> translate<25.400000,-1.535000,6.681900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<25.400000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<26.277900,0.000000,35.952100>}
box{<0,0,-0.400000><1.241538,0.035000,0.400000> rotate<0,44.997030,0> translate<25.400000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<26.277900,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<26.277900,0.000000,35.952100>}
box{<0,0,-0.400000><6.742100,0.035000,0.400000> rotate<0,90.000000,0> translate<26.277900,0.000000,35.952100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<26.670000,-1.535000,25.515900>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<26.670000,-1.535000,22.860000>}
box{<0,0,-0.400000><2.655900,0.035000,0.400000> rotate<0,-90.000000,0> translate<26.670000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<25.060000,0.000000,40.120000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<27.268100,0.000000,40.120000>}
box{<0,0,-0.400000><2.208100,0.035000,0.400000> rotate<0,0.000000,0> translate<25.060000,0.000000,40.120000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<21.903600,-1.535000,47.025100>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<27.700500,-1.535000,47.025100>}
box{<0,0,-0.400000><5.796900,0.035000,0.400000> rotate<0,0.000000,0> translate<21.903600,-1.535000,47.025100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<27.760000,-1.535000,46.965600>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<27.760000,-1.535000,46.520000>}
box{<0,0,-0.400000><0.445600,0.035000,0.400000> rotate<0,-90.000000,0> translate<27.760000,-1.535000,46.520000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.700500,-1.535000,47.025100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.760000,-1.535000,46.965600>}
box{<0,0,-0.203200><0.084146,0.035000,0.203200> rotate<0,44.997030,0> translate<27.700500,-1.535000,47.025100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<26.670000,-1.535000,25.515900>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<27.940000,-1.535000,26.785900>}
box{<0,0,-0.400000><1.796051,0.035000,0.400000> rotate<0,-44.997030,0> translate<26.670000,-1.535000,25.515900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<27.940000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<27.940000,-1.535000,26.785900>}
box{<0,0,-0.400000><2.424100,0.035000,0.400000> rotate<0,-90.000000,0> translate<27.940000,-1.535000,26.785900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<26.277900,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<27.940000,0.000000,29.210000>}
box{<0,0,-0.400000><1.662100,0.035000,0.400000> rotate<0,0.000000,0> translate<26.277900,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<9.914900,-1.535000,14.332400>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<28.312100,-1.535000,32.729600>}
box{<0,0,-0.400000><26.017570,0.035000,0.400000> rotate<0,-44.997030,0> translate<9.914900,-1.535000,14.332400> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<7.720100,-1.535000,13.976300>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<28.913000,-1.535000,35.169200>}
box{<0,0,-0.400000><29.971287,0.035000,0.400000> rotate<0,-44.997030,0> translate<7.720100,-1.535000,13.976300> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<28.913000,-1.535000,35.169200>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<28.913000,-1.535000,37.243200>}
box{<0,0,-0.400000><2.074000,0.035000,0.400000> rotate<0,90.000000,0> translate<28.913000,-1.535000,37.243200> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<28.913000,-1.535000,37.243200>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<29.896800,-1.535000,38.227000>}
box{<0,0,-0.400000><1.391303,0.035000,0.400000> rotate<0,-44.997030,0> translate<28.913000,-1.535000,37.243200> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<27.268100,0.000000,40.120000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<30.466500,0.000000,36.921600>}
box{<0,0,-0.400000><4.523221,0.035000,0.400000> rotate<0,44.997030,0> translate<27.268100,0.000000,40.120000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<27.940000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<30.480000,-1.535000,8.890000>}
box{<0,0,-0.400000><2.540000,0.035000,0.400000> rotate<0,0.000000,0> translate<27.940000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<30.480000,-1.535000,25.690500>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<30.480000,-1.535000,29.210000>}
box{<0,0,-0.400000><3.519500,0.035000,0.400000> rotate<0,90.000000,0> translate<30.480000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<30.466500,-1.535000,36.921600>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<30.480000,-1.535000,36.908100>}
box{<0,0,-0.400000><0.019092,0.035000,0.400000> rotate<0,44.997030,0> translate<30.466500,-1.535000,36.921600> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<30.480000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<30.480000,-1.535000,36.908100>}
box{<0,0,-0.400000><7.698100,0.035000,0.400000> rotate<0,90.000000,0> translate<30.480000,-1.535000,36.908100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<31.750000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<31.750000,0.000000,16.510000>}
box{<0,0,-0.400000><6.350000,0.035000,0.400000> rotate<0,-90.000000,0> translate<31.750000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<30.480000,-1.535000,25.690500>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<31.750000,-1.535000,24.420500>}
box{<0,0,-0.400000><1.796051,0.035000,0.400000> rotate<0,44.997030,0> translate<30.480000,-1.535000,25.690500> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<31.750000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<31.750000,-1.535000,24.420500>}
box{<0,0,-0.400000><1.560500,0.035000,0.400000> rotate<0,90.000000,0> translate<31.750000,-1.535000,24.420500> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<31.750000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<31.879000,-1.535000,22.860000>}
box{<0,0,-0.400000><0.129000,0.035000,0.400000> rotate<0,0.000000,0> translate<31.750000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<30.480000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<33.020000,-1.535000,8.890000>}
box{<0,0,-0.400000><2.540000,0.035000,0.400000> rotate<0,0.000000,0> translate<30.480000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<31.879000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<33.310500,-1.535000,22.860000>}
box{<0,0,-0.400000><1.431500,0.035000,0.400000> rotate<0,0.000000,0> translate<31.879000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<33.310500,-1.535000,22.860100>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<33.310500,-1.535000,22.860000>}
box{<0,0,-0.400000><0.000100,0.035000,0.400000> rotate<0,-90.000000,0> translate<33.310500,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<29.896800,-1.535000,38.227000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<34.163000,-1.535000,38.227000>}
box{<0,0,-0.400000><4.266200,0.035000,0.400000> rotate<0,0.000000,0> translate<29.896800,-1.535000,38.227000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<34.163000,-1.535000,38.227000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<34.163000,-1.535000,44.613500>}
box{<0,0,-0.400000><6.386500,0.035000,0.400000> rotate<0,90.000000,0> translate<34.163000,-1.535000,44.613500> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<33.020000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<34.682100,0.000000,29.210000>}
box{<0,0,-0.400000><1.662100,0.035000,0.400000> rotate<0,0.000000,0> translate<33.020000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<28.312100,-1.535000,32.729600>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<34.849300,-1.535000,32.729600>}
box{<0,0,-0.400000><6.537200,0.035000,0.400000> rotate<0,0.000000,0> translate<28.312100,-1.535000,32.729600> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<13.805000,-1.535000,4.081700>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<35.499800,-1.535000,4.081700>}
box{<0,0,-0.400000><21.694800,0.035000,0.400000> rotate<0,0.000000,0> translate<13.805000,-1.535000,4.081700> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<33.020000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<35.560000,-1.535000,8.890000>}
box{<0,0,-0.400000><2.540000,0.035000,0.400000> rotate<0,0.000000,0> translate<33.020000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<35.560000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<35.560000,-1.535000,11.098100>}
box{<0,0,-0.400000><2.208100,0.035000,0.400000> rotate<0,90.000000,0> translate<35.560000,-1.535000,11.098100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<34.163000,-1.535000,38.227000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<35.560000,-1.535000,36.830000>}
box{<0,0,-0.400000><1.975656,0.035000,0.400000> rotate<0,44.997030,0> translate<34.163000,-1.535000,38.227000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<34.682100,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<35.952100,0.000000,27.940000>}
box{<0,0,-0.400000><1.796051,0.035000,0.400000> rotate<0,44.997030,0> translate<34.682100,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<35.560000,-1.535000,11.098100>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<36.498100,-1.535000,11.098100>}
box{<0,0,-0.400000><0.938100,0.035000,0.400000> rotate<0,0.000000,0> translate<35.560000,-1.535000,11.098100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<24.237600,-1.535000,20.161200>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<36.535800,-1.535000,20.161200>}
box{<0,0,-0.400000><12.298200,0.035000,0.400000> rotate<0,0.000000,0> translate<24.237600,-1.535000,20.161200> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<31.750000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<36.830000,0.000000,11.430000>}
box{<0,0,-0.400000><7.184205,0.035000,0.400000> rotate<0,44.997030,0> translate<31.750000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<36.498100,-1.535000,11.098100>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<36.830000,-1.535000,11.430000>}
box{<0,0,-0.400000><0.469377,0.035000,0.400000> rotate<0,-44.997030,0> translate<36.498100,-1.535000,11.098100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<33.310500,-1.535000,22.860100>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<36.830100,-1.535000,22.860100>}
box{<0,0,-0.400000><3.519600,0.035000,0.400000> rotate<0,0.000000,0> translate<33.310500,-1.535000,22.860100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<34.163000,-1.535000,44.613500>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<37.809500,-1.535000,48.260000>}
box{<0,0,-0.400000><5.156930,0.035000,0.400000> rotate<0,-44.997030,0> translate<34.163000,-1.535000,44.613500> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<35.499800,-1.535000,4.081700>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<38.100000,-1.535000,6.681900>}
box{<0,0,-0.400000><3.677238,0.035000,0.400000> rotate<0,-44.997030,0> translate<35.499800,-1.535000,4.081700> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<38.100000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<38.100000,-1.535000,6.681900>}
box{<0,0,-0.400000><2.208100,0.035000,0.400000> rotate<0,-90.000000,0> translate<38.100000,-1.535000,6.681900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<24.874800,-1.535000,18.861100>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<39.181100,-1.535000,18.861100>}
box{<0,0,-0.400000><14.306300,0.035000,0.400000> rotate<0,0.000000,0> translate<24.874800,-1.535000,18.861100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<35.952100,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<39.370000,0.000000,27.940000>}
box{<0,0,-0.400000><3.417900,0.035000,0.400000> rotate<0,0.000000,0> translate<35.952100,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<37.809500,-1.535000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<39.370000,-1.535000,48.260000>}
box{<0,0,-0.400000><1.560500,0.035000,0.400000> rotate<0,0.000000,0> translate<37.809500,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<39.396100,0.000000,15.099700>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<39.396100,0.000000,16.699700>}
box{<0,0,-0.400000><1.600000,0.035000,0.400000> rotate<0,90.000000,0> translate<39.396100,0.000000,16.699700> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<34.849300,-1.535000,32.729600>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<39.944000,-1.535000,37.824300>}
box{<0,0,-0.400000><7.204994,0.035000,0.400000> rotate<0,-44.997030,0> translate<34.849300,-1.535000,32.729600> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<23.626100,-1.535000,15.107800>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<40.170000,-1.535000,15.107800>}
box{<0,0,-0.400000><16.543900,0.035000,0.400000> rotate<0,0.000000,0> translate<23.626100,-1.535000,15.107800> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<36.830000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<40.308100,-1.535000,11.430000>}
box{<0,0,-0.400000><3.478100,0.035000,0.400000> rotate<0,0.000000,0> translate<36.830000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<40.308100,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<40.640000,-1.535000,11.098100>}
box{<0,0,-0.400000><0.469377,0.035000,0.400000> rotate<0,44.997030,0> translate<40.308100,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<40.640000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<40.640000,-1.535000,11.098100>}
box{<0,0,-0.400000><2.208100,0.035000,0.400000> rotate<0,90.000000,0> translate<40.640000,-1.535000,11.098100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<39.370000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<40.930500,0.000000,40.640000>}
box{<0,0,-0.400000><1.560500,0.035000,0.400000> rotate<0,0.000000,0> translate<39.370000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<39.370000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<41.090000,0.000000,29.660000>}
box{<0,0,-0.400000><2.432447,0.035000,0.400000> rotate<0,-44.997030,0> translate<39.370000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<36.535800,-1.535000,20.161200>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<41.455500,-1.535000,25.080900>}
box{<0,0,-0.400000><6.957506,0.035000,0.400000> rotate<0,-44.997030,0> translate<36.535800,-1.535000,20.161200> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<24.854000,-1.535000,13.770200>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<41.710200,-1.535000,13.770200>}
box{<0,0,-0.400000><16.856200,0.035000,0.400000> rotate<0,0.000000,0> translate<24.854000,-1.535000,13.770200> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<36.830100,-1.535000,22.860100>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<41.910000,-1.535000,27.940000>}
box{<0,0,-0.400000><7.184063,0.035000,0.400000> rotate<0,-44.997030,0> translate<36.830100,-1.535000,22.860100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<41.910000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<41.910000,-1.535000,29.640200>}
box{<0,0,-0.400000><1.700200,0.035000,0.400000> rotate<0,90.000000,0> translate<41.910000,-1.535000,29.640200> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<39.396100,0.000000,15.099700>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<42.137200,0.000000,12.358600>}
box{<0,0,-0.400000><3.876501,0.035000,0.400000> rotate<0,44.997030,0> translate<39.396100,0.000000,15.099700> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<40.170000,-1.535000,15.107800>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<42.523100,-1.535000,17.460900>}
box{<0,0,-0.400000><3.327786,0.035000,0.400000> rotate<0,-44.997030,0> translate<40.170000,-1.535000,15.107800> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<42.137200,-1.535000,12.358600>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<43.180000,-1.535000,11.315800>}
box{<0,0,-0.400000><1.474742,0.035000,0.400000> rotate<0,44.997030,0> translate<42.137200,-1.535000,12.358600> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<43.180000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<43.180000,-1.535000,11.315800>}
box{<0,0,-0.400000><2.425800,0.035000,0.400000> rotate<0,90.000000,0> translate<43.180000,-1.535000,11.315800> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<41.710200,-1.535000,13.770200>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<43.180000,-1.535000,15.240000>}
box{<0,0,-0.400000><2.078611,0.035000,0.400000> rotate<0,-44.997030,0> translate<41.710200,-1.535000,13.770200> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<39.181100,-1.535000,18.861100>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<43.180000,-1.535000,22.860000>}
box{<0,0,-0.400000><5.655299,0.035000,0.400000> rotate<0,-44.997030,0> translate<39.181100,-1.535000,18.861100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<41.910000,-1.535000,29.640200>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<43.319700,-1.535000,29.640200>}
box{<0,0,-0.400000><1.409700,0.035000,0.400000> rotate<0,0.000000,0> translate<41.910000,-1.535000,29.640200> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<39.396100,-1.535000,16.699700>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<43.335500,-1.535000,20.639100>}
box{<0,0,-0.400000><5.571153,0.035000,0.400000> rotate<0,-44.997030,0> translate<39.396100,-1.535000,16.699700> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<45.720000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<45.720000,-1.535000,6.681900>}
box{<0,0,-0.400000><2.208100,0.035000,0.400000> rotate<0,-90.000000,0> translate<45.720000,-1.535000,6.681900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<42.523100,-1.535000,17.460900>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<45.720000,-1.535000,17.460900>}
box{<0,0,-0.400000><3.196900,0.035000,0.400000> rotate<0,0.000000,0> translate<42.523100,-1.535000,17.460900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<45.720000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<45.720000,-1.535000,17.460900>}
box{<0,0,-0.400000><2.220900,0.035000,0.400000> rotate<0,90.000000,0> translate<45.720000,-1.535000,17.460900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<41.455500,-1.535000,25.080900>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<45.720000,-1.535000,25.080900>}
box{<0,0,-0.400000><4.264500,0.035000,0.400000> rotate<0,0.000000,0> translate<41.455500,-1.535000,25.080900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<45.720000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<45.720000,-1.535000,25.080900>}
box{<0,0,-0.400000><2.220900,0.035000,0.400000> rotate<0,90.000000,0> translate<45.720000,-1.535000,25.080900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<41.090000,0.000000,29.660000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<47.519500,0.000000,29.660000>}
box{<0,0,-0.400000><6.429500,0.035000,0.400000> rotate<0,0.000000,0> translate<41.090000,0.000000,29.660000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<47.953900,-1.535000,29.848900>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<47.953900,-1.535000,25.387000>}
box{<0,0,-0.400000><4.461900,0.035000,0.400000> rotate<0,-90.000000,0> translate<47.953900,-1.535000,25.387000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<47.519500,0.000000,29.660000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<47.969500,0.000000,29.210000>}
box{<0,0,-0.400000><0.636396,0.035000,0.400000> rotate<0,44.997030,0> translate<47.519500,0.000000,29.660000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<43.319700,-1.535000,29.640200>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<47.969500,-1.535000,34.290000>}
box{<0,0,-0.400000><6.575810,0.035000,0.400000> rotate<0,-44.997030,0> translate<43.319700,-1.535000,29.640200> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<48.260000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<48.260000,-1.535000,6.681900>}
box{<0,0,-0.400000><2.208100,0.035000,0.400000> rotate<0,-90.000000,0> translate<48.260000,-1.535000,6.681900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<47.953900,-1.535000,25.387000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<48.260000,-1.535000,25.080900>}
box{<0,0,-0.400000><0.432891,0.035000,0.400000> rotate<0,44.997030,0> translate<47.953900,-1.535000,25.387000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<48.260000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<48.260000,-1.535000,25.080900>}
box{<0,0,-0.400000><2.220900,0.035000,0.400000> rotate<0,90.000000,0> translate<48.260000,-1.535000,25.080900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<47.953900,-1.535000,29.848900>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<48.913700,-1.535000,30.808700>}
box{<0,0,-0.400000><1.357362,0.035000,0.400000> rotate<0,-44.997030,0> translate<47.953900,-1.535000,29.848900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<39.370000,-1.535000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<49.225200,-1.535000,48.260000>}
box{<0,0,-0.400000><9.855200,0.035000,0.400000> rotate<0,0.000000,0> translate<39.370000,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<49.530000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<49.530000,-1.535000,27.649500>}
box{<0,0,-0.400000><1.560500,0.035000,0.400000> rotate<0,-90.000000,0> translate<49.530000,-1.535000,27.649500> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<47.969500,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<49.530000,0.000000,29.210000>}
box{<0,0,-0.400000><1.560500,0.035000,0.400000> rotate<0,0.000000,0> translate<47.969500,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<47.969500,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<49.530000,-1.535000,34.290000>}
box{<0,0,-0.400000><1.560500,0.035000,0.400000> rotate<0,0.000000,0> translate<47.969500,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<45.720000,-1.535000,6.681900>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<49.861900,-1.535000,2.540000>}
box{<0,0,-0.400000><5.857531,0.035000,0.400000> rotate<0,44.997030,0> translate<45.720000,-1.535000,6.681900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<49.880700,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<49.880700,0.000000,37.458800>}
box{<0,0,-0.400000><3.181200,0.035000,0.400000> rotate<0,-90.000000,0> translate<49.880700,0.000000,37.458800> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<40.930500,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<49.880700,0.000000,40.640000>}
box{<0,0,-0.400000><8.950200,0.035000,0.400000> rotate<0,0.000000,0> translate<40.930500,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<49.880700,0.000000,46.618600>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<49.880700,0.000000,40.640000>}
box{<0,0,-0.400000><5.978600,0.035000,0.400000> rotate<0,-90.000000,0> translate<49.880700,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<50.800000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<50.800000,-1.535000,11.098100>}
box{<0,0,-0.400000><2.208100,0.035000,0.400000> rotate<0,90.000000,0> translate<50.800000,-1.535000,11.098100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<43.335500,-1.535000,20.639100>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<50.800000,-1.535000,20.639100>}
box{<0,0,-0.400000><7.464500,0.035000,0.400000> rotate<0,0.000000,0> translate<43.335500,-1.535000,20.639100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<50.800000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<50.800000,-1.535000,20.639100>}
box{<0,0,-0.400000><2.220900,0.035000,0.400000> rotate<0,-90.000000,0> translate<50.800000,-1.535000,20.639100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<49.880700,0.000000,46.618600>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<50.904600,0.000000,47.642500>}
box{<0,0,-0.400000><1.448013,0.035000,0.400000> rotate<0,-44.997030,0> translate<49.880700,0.000000,46.618600> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<49.530000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<51.090500,-1.535000,34.290000>}
box{<0,0,-0.400000><1.560500,0.035000,0.400000> rotate<0,0.000000,0> translate<49.530000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<50.800000,-1.535000,11.098100>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<51.419000,-1.535000,11.098100>}
box{<0,0,-0.400000><0.619000,0.035000,0.400000> rotate<0,0.000000,0> translate<50.800000,-1.535000,11.098100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<49.225200,-1.535000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<51.612800,-1.535000,45.872400>}
box{<0,0,-0.400000><3.376576,0.035000,0.400000> rotate<0,44.997030,0> translate<49.225200,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<49.880700,0.000000,37.458800>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<51.779500,0.000000,35.560000>}
box{<0,0,-0.400000><2.685309,0.035000,0.400000> rotate<0,44.997030,0> translate<49.880700,0.000000,37.458800> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<51.090500,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<52.041400,-1.535000,33.339100>}
box{<0,0,-0.400000><1.344776,0.035000,0.400000> rotate<0,44.997030,0> translate<51.090500,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<49.530000,-1.535000,27.649500>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<52.098600,-1.535000,25.080900>}
box{<0,0,-0.400000><3.632549,0.035000,0.400000> rotate<0,44.997030,0> translate<49.530000,-1.535000,27.649500> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<50.904600,0.000000,47.642500>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<52.611300,0.000000,47.642500>}
box{<0,0,-0.400000><1.706700,0.035000,0.400000> rotate<0,0.000000,0> translate<50.904600,0.000000,47.642500> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<51.612800,-1.535000,45.872400>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<53.332400,-1.535000,47.592000>}
box{<0,0,-0.400000><2.431882,0.035000,0.400000> rotate<0,-44.997030,0> translate<51.612800,-1.535000,45.872400> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<48.260000,-1.535000,6.681900>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<53.340000,-1.535000,6.681900>}
box{<0,0,-0.400000><5.080000,0.035000,0.400000> rotate<0,0.000000,0> translate<48.260000,-1.535000,6.681900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<53.340000,-1.535000,7.007000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<53.340000,-1.535000,6.681900>}
box{<0,0,-0.400000><0.325100,0.035000,0.400000> rotate<0,-90.000000,0> translate<53.340000,-1.535000,6.681900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<53.340000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<53.340000,-1.535000,7.007000>}
box{<0,0,-0.400000><1.883000,0.035000,0.400000> rotate<0,-90.000000,0> translate<53.340000,-1.535000,7.007000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<51.419000,-1.535000,11.098100>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<53.340000,-1.535000,13.019100>}
box{<0,0,-0.400000><2.716704,0.035000,0.400000> rotate<0,-44.997030,0> translate<51.419000,-1.535000,11.098100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<53.340000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<53.340000,-1.535000,13.019100>}
box{<0,0,-0.400000><2.220900,0.035000,0.400000> rotate<0,-90.000000,0> translate<53.340000,-1.535000,13.019100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<53.340000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<53.340000,-1.535000,20.639100>}
box{<0,0,-0.400000><2.220900,0.035000,0.400000> rotate<0,-90.000000,0> translate<53.340000,-1.535000,20.639100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<52.098600,-1.535000,25.080900>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<53.340000,-1.535000,25.080900>}
box{<0,0,-0.400000><1.241400,0.035000,0.400000> rotate<0,0.000000,0> translate<52.098600,-1.535000,25.080900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<53.340000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<53.340000,-1.535000,25.080900>}
box{<0,0,-0.400000><2.220900,0.035000,0.400000> rotate<0,90.000000,0> translate<53.340000,-1.535000,25.080900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<51.779500,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<53.340000,0.000000,35.560000>}
box{<0,0,-0.400000><1.560500,0.035000,0.400000> rotate<0,0.000000,0> translate<51.779500,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<53.340000,-1.535000,13.019100>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<53.959000,-1.535000,13.019100>}
box{<0,0,-0.400000><0.619000,0.035000,0.400000> rotate<0,0.000000,0> translate<53.340000,-1.535000,13.019100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<52.611300,0.000000,47.642500>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<54.381400,0.000000,45.872400>}
box{<0,0,-0.400000><2.503299,0.035000,0.400000> rotate<0,44.997030,0> translate<52.611300,0.000000,47.642500> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<54.610000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<54.610000,0.000000,29.500500>}
box{<0,0,-0.400000><1.560500,0.035000,0.400000> rotate<0,90.000000,0> translate<54.610000,0.000000,29.500500> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<53.340000,-1.535000,20.639100>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<54.819100,-1.535000,19.160000>}
box{<0,0,-0.400000><2.091763,0.035000,0.400000> rotate<0,44.997030,0> translate<53.340000,-1.535000,20.639100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<53.332400,-1.535000,47.592000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<55.430400,-1.535000,47.592000>}
box{<0,0,-0.400000><2.098000,0.035000,0.400000> rotate<0,0.000000,0> translate<53.332400,-1.535000,47.592000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<53.959000,-1.535000,13.019100>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<55.880000,-1.535000,11.098100>}
box{<0,0,-0.400000><2.716704,0.035000,0.400000> rotate<0,44.997030,0> translate<53.959000,-1.535000,13.019100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<55.880000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<55.880000,-1.535000,11.098100>}
box{<0,0,-0.400000><2.208100,0.035000,0.400000> rotate<0,90.000000,0> translate<55.880000,-1.535000,11.098100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<55.880000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<55.880000,-1.535000,13.019100>}
box{<0,0,-0.400000><2.220900,0.035000,0.400000> rotate<0,-90.000000,0> translate<55.880000,-1.535000,13.019100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<55.880000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<55.880000,-1.535000,20.639100>}
box{<0,0,-0.400000><2.220900,0.035000,0.400000> rotate<0,-90.000000,0> translate<55.880000,-1.535000,20.639100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<54.610000,0.000000,29.500500>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<55.880000,0.000000,30.770500>}
box{<0,0,-0.400000><1.796051,0.035000,0.400000> rotate<0,-44.997030,0> translate<54.610000,0.000000,29.500500> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<55.880000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<55.880000,0.000000,30.770500>}
box{<0,0,-0.400000><4.789500,0.035000,0.400000> rotate<0,-90.000000,0> translate<55.880000,0.000000,30.770500> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<48.913700,-1.535000,30.808700>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<56.547700,-1.535000,30.808700>}
box{<0,0,-0.400000><7.634000,0.035000,0.400000> rotate<0,0.000000,0> translate<48.913700,-1.535000,30.808700> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<52.041400,-1.535000,33.339100>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<56.615600,-1.535000,33.339100>}
box{<0,0,-0.400000><4.574200,0.035000,0.400000> rotate<0,0.000000,0> translate<52.041400,-1.535000,33.339100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<55.430400,-1.535000,47.592000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<57.150000,-1.535000,45.872400>}
box{<0,0,-0.400000><2.431882,0.035000,0.400000> rotate<0,44.997030,0> translate<55.430400,-1.535000,47.592000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<58.420000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<58.420000,-1.535000,25.080900>}
box{<0,0,-0.400000><2.220900,0.035000,0.400000> rotate<0,90.000000,0> translate<58.420000,-1.535000,25.080900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<56.615600,-1.535000,33.339100>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<58.420000,-1.535000,35.143500>}
box{<0,0,-0.400000><2.551807,0.035000,0.400000> rotate<0,-44.997030,0> translate<56.615600,-1.535000,33.339100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<58.420000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<58.420000,-1.535000,35.143500>}
box{<0,0,-0.400000><0.416500,0.035000,0.400000> rotate<0,-90.000000,0> translate<58.420000,-1.535000,35.143500> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<58.420000,-1.535000,25.080900>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<58.830500,-1.535000,25.080900>}
box{<0,0,-0.400000><0.410500,0.035000,0.400000> rotate<0,0.000000,0> translate<58.420000,-1.535000,25.080900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<57.150000,-1.535000,45.872400>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<58.869500,-1.535000,47.591900>}
box{<0,0,-0.400000><2.431740,0.035000,0.400000> rotate<0,-44.997030,0> translate<57.150000,-1.535000,45.872400> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<39.944000,-1.535000,37.824300>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<59.093200,-1.535000,37.824300>}
box{<0,0,-0.400000><19.149200,0.035000,0.400000> rotate<0,0.000000,0> translate<39.944000,-1.535000,37.824300> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<58.830500,-1.535000,25.080900>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<59.464800,-1.535000,25.715200>}
box{<0,0,-0.400000><0.897036,0.035000,0.400000> rotate<0,-44.997030,0> translate<58.830500,-1.535000,25.080900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<59.690000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<59.690000,-1.535000,28.919500>}
box{<0,0,-0.400000><1.560500,0.035000,0.400000> rotate<0,-90.000000,0> translate<59.690000,-1.535000,28.919500> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<58.420000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<59.980500,0.000000,35.560000>}
box{<0,0,-0.400000><1.560500,0.035000,0.400000> rotate<0,0.000000,0> translate<58.420000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<56.547700,-1.535000,30.808700>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<59.983800,-1.535000,34.244800>}
box{<0,0,-0.400000><4.859379,0.035000,0.400000> rotate<0,-44.997030,0> translate<56.547700,-1.535000,30.808700> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<59.983800,-1.535000,36.933700>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<59.983800,-1.535000,34.244800>}
box{<0,0,-0.400000><2.688900,0.035000,0.400000> rotate<0,-90.000000,0> translate<59.983800,-1.535000,34.244800> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<59.093200,-1.535000,37.824300>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<59.983800,-1.535000,36.933700>}
box{<0,0,-0.400000><1.259499,0.035000,0.400000> rotate<0,44.997030,0> translate<59.093200,-1.535000,37.824300> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<60.960000,-1.535000,27.649500>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<60.960000,-1.535000,22.860000>}
box{<0,0,-0.400000><4.789500,0.035000,0.400000> rotate<0,-90.000000,0> translate<60.960000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<59.690000,-1.535000,28.919500>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<60.960000,-1.535000,27.649500>}
box{<0,0,-0.400000><1.796051,0.035000,0.400000> rotate<0,44.997030,0> translate<59.690000,-1.535000,28.919500> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<58.869500,-1.535000,47.591900>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<60.967700,-1.535000,47.591900>}
box{<0,0,-0.400000><2.098200,0.035000,0.400000> rotate<0,0.000000,0> translate<58.869500,-1.535000,47.591900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<59.918600,0.000000,45.872400>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<61.669400,0.000000,47.623200>}
box{<0,0,-0.400000><2.476005,0.035000,0.400000> rotate<0,-44.997030,0> translate<59.918600,0.000000,45.872400> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<59.980500,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<62.201400,0.000000,37.780900>}
box{<0,0,-0.400000><3.140827,0.035000,0.400000> rotate<0,-44.997030,0> translate<59.980500,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<60.967700,-1.535000,47.591900>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<62.687200,-1.535000,45.872400>}
box{<0,0,-0.400000><2.431740,0.035000,0.400000> rotate<0,44.997030,0> translate<60.967700,-1.535000,47.591900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<61.669400,0.000000,47.623200>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<63.417300,0.000000,47.623200>}
box{<0,0,-0.400000><1.747900,0.035000,0.400000> rotate<0,0.000000,0> translate<61.669400,0.000000,47.623200> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<63.500000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<63.500000,-1.535000,25.080900>}
box{<0,0,-0.400000><2.220900,0.035000,0.400000> rotate<0,90.000000,0> translate<63.500000,-1.535000,25.080900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<63.500000,-1.535000,38.419100>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<63.500000,-1.535000,35.560000>}
box{<0,0,-0.400000><2.859100,0.035000,0.400000> rotate<0,-90.000000,0> translate<63.500000,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<63.500000,-1.535000,40.830500>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<63.500000,-1.535000,38.419100>}
box{<0,0,-0.400000><2.411400,0.035000,0.400000> rotate<0,-90.000000,0> translate<63.500000,-1.535000,38.419100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<61.302900,-1.535000,43.027600>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<63.500000,-1.535000,40.830500>}
box{<0,0,-0.400000><3.107169,0.035000,0.400000> rotate<0,44.997030,0> translate<61.302900,-1.535000,43.027600> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<54.819100,-1.535000,19.160000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<64.356000,-1.535000,19.160000>}
box{<0,0,-0.400000><9.536900,0.035000,0.400000> rotate<0,0.000000,0> translate<54.819100,-1.535000,19.160000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<63.500000,-1.535000,25.080900>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<64.770000,-1.535000,26.350900>}
box{<0,0,-0.400000><1.796051,0.035000,0.400000> rotate<0,-44.997030,0> translate<63.500000,-1.535000,25.080900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<64.770000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<64.770000,-1.535000,26.350900>}
box{<0,0,-0.400000><1.589100,0.035000,0.400000> rotate<0,-90.000000,0> translate<64.770000,-1.535000,26.350900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<62.687200,-1.535000,45.872400>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<65.074800,-1.535000,48.260000>}
box{<0,0,-0.400000><3.376576,0.035000,0.400000> rotate<0,-44.997030,0> translate<62.687200,-1.535000,45.872400> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<66.040000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<66.040000,0.000000,33.339100>}
box{<0,0,-0.400000><2.220900,0.035000,0.400000> rotate<0,-90.000000,0> translate<66.040000,0.000000,33.339100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<66.275400,0.000000,44.765100>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<66.275400,0.000000,44.177500>}
box{<0,0,-0.400000><0.587600,0.035000,0.400000> rotate<0,-90.000000,0> translate<66.275400,0.000000,44.177500> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<63.417300,0.000000,47.623200>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<66.275400,0.000000,44.765100>}
box{<0,0,-0.400000><4.041964,0.035000,0.400000> rotate<0,44.997030,0> translate<63.417300,0.000000,47.623200> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<64.356000,-1.535000,19.160000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<66.475000,-1.535000,17.041000>}
box{<0,0,-0.400000><2.996719,0.035000,0.400000> rotate<0,44.997030,0> translate<64.356000,-1.535000,19.160000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<68.289500,0.000000,31.089600>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<68.289500,0.000000,30.480000>}
box{<0,0,-0.400000><0.609600,0.035000,0.400000> rotate<0,-90.000000,0> translate<68.289500,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<66.040000,0.000000,33.339100>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<68.289500,0.000000,31.089600>}
box{<0,0,-0.400000><3.181273,0.035000,0.400000> rotate<0,44.997030,0> translate<66.040000,0.000000,33.339100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<63.500000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<68.580000,-1.535000,15.240000>}
box{<0,0,-0.400000><5.080000,0.035000,0.400000> rotate<0,0.000000,0> translate<63.500000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<68.580000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<68.580000,-1.535000,33.339100>}
box{<0,0,-0.400000><2.220900,0.035000,0.400000> rotate<0,-90.000000,0> translate<68.580000,-1.535000,33.339100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<62.201400,0.000000,37.780900>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<68.580000,0.000000,37.780900>}
box{<0,0,-0.400000><6.378600,0.035000,0.400000> rotate<0,0.000000,0> translate<62.201400,0.000000,37.780900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<68.580000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<68.580000,0.000000,37.780900>}
box{<0,0,-0.400000><2.220900,0.035000,0.400000> rotate<0,90.000000,0> translate<68.580000,0.000000,37.780900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<55.880000,-1.535000,13.019100>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<69.728700,-1.535000,13.019100>}
box{<0,0,-0.400000><13.848700,0.035000,0.400000> rotate<0,0.000000,0> translate<55.880000,-1.535000,13.019100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<68.289500,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<69.850000,0.000000,30.480000>}
box{<0,0,-0.400000><1.560500,0.035000,0.400000> rotate<0,0.000000,0> translate<68.289500,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<71.120000,0.000000,39.332900>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<71.120000,0.000000,35.560000>}
box{<0,0,-0.400000><3.772900,0.035000,0.400000> rotate<0,-90.000000,0> translate<71.120000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<66.275400,0.000000,44.177500>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<71.120000,0.000000,39.332900>}
box{<0,0,-0.400000><6.851299,0.035000,0.400000> rotate<0,44.997030,0> translate<66.275400,0.000000,44.177500> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<55.880000,-1.535000,20.639100>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<71.141000,-1.535000,20.639100>}
box{<0,0,-0.400000><15.261000,0.035000,0.400000> rotate<0,0.000000,0> translate<55.880000,-1.535000,20.639100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<55.880000,-1.535000,11.098100>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<71.437400,-1.535000,11.098100>}
box{<0,0,-0.400000><15.557400,0.035000,0.400000> rotate<0,0.000000,0> translate<55.880000,-1.535000,11.098100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<69.728700,-1.535000,13.019100>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<72.292900,-1.535000,15.583300>}
box{<0,0,-0.400000><3.626326,0.035000,0.400000> rotate<0,-44.997030,0> translate<69.728700,-1.535000,13.019100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<53.340000,-1.535000,6.681900>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<72.618100,-1.535000,6.681900>}
box{<0,0,-0.400000><19.278100,0.035000,0.400000> rotate<0,0.000000,0> translate<53.340000,-1.535000,6.681900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<71.437400,-1.535000,11.098100>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<73.039300,-1.535000,12.700000>}
box{<0,0,-0.400000><2.265429,0.035000,0.400000> rotate<0,-44.997030,0> translate<71.437400,-1.535000,11.098100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<71.120000,0.000000,39.332900>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<73.332400,0.000000,39.332900>}
box{<0,0,-0.400000><2.212400,0.035000,0.400000> rotate<0,0.000000,0> translate<71.120000,0.000000,39.332900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<68.580000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<73.660000,-1.535000,20.320000>}
box{<0,0,-0.400000><7.184205,0.035000,0.400000> rotate<0,-44.997030,0> translate<68.580000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<73.660000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<73.660000,0.000000,30.480000>}
box{<0,0,-0.400000><5.080000,0.035000,0.400000> rotate<0,-90.000000,0> translate<73.660000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<66.475000,0.000000,17.041000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<74.295200,0.000000,17.041000>}
box{<0,0,-0.400000><7.820200,0.035000,0.400000> rotate<0,0.000000,0> translate<66.475000,0.000000,17.041000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<73.332400,0.000000,39.332900>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<74.639500,0.000000,40.640000>}
box{<0,0,-0.400000><1.848519,0.035000,0.400000> rotate<0,-44.997030,0> translate<73.332400,0.000000,39.332900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<73.039300,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<74.930000,-1.535000,12.700000>}
box{<0,0,-0.400000><1.890700,0.035000,0.400000> rotate<0,0.000000,0> translate<73.039300,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<68.580000,-1.535000,33.339100>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<76.200000,-1.535000,33.339100>}
box{<0,0,-0.400000><7.620000,0.035000,0.400000> rotate<0,0.000000,0> translate<68.580000,-1.535000,33.339100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<76.200000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<76.200000,-1.535000,33.339100>}
box{<0,0,-0.400000><2.220900,0.035000,0.400000> rotate<0,-90.000000,0> translate<76.200000,-1.535000,33.339100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<74.639500,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<76.200000,0.000000,40.640000>}
box{<0,0,-0.400000><1.560500,0.035000,0.400000> rotate<0,0.000000,0> translate<74.639500,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<65.074800,-1.535000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<76.200000,-1.535000,48.260000>}
box{<0,0,-0.400000><11.125200,0.035000,0.400000> rotate<0,0.000000,0> translate<65.074800,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<49.861900,-1.535000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<77.470000,-1.535000,2.540000>}
box{<0,0,-0.400000><27.608100,0.035000,0.400000> rotate<0,0.000000,0> translate<49.861900,-1.535000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<72.618100,-1.535000,6.681900>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<78.119300,-1.535000,12.183100>}
box{<0,0,-0.400000><7.779872,0.035000,0.400000> rotate<0,-44.997030,0> translate<72.618100,-1.535000,6.681900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<78.119300,-1.535000,12.183100>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<78.119300,-1.535000,12.700000>}
box{<0,0,-0.400000><0.516900,0.035000,0.400000> rotate<0,90.000000,0> translate<78.119300,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<74.295200,0.000000,17.041000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<78.119300,0.000000,13.216900>}
box{<0,0,-0.400000><5.408094,0.035000,0.400000> rotate<0,44.997030,0> translate<74.295200,0.000000,17.041000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<78.119300,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<78.119300,0.000000,13.216900>}
box{<0,0,-0.400000><0.516900,0.035000,0.400000> rotate<0,90.000000,0> translate<78.119300,0.000000,13.216900> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<63.500000,-1.535000,38.419100>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<78.740000,-1.535000,38.419100>}
box{<0,0,-0.400000><15.240000,0.035000,0.400000> rotate<0,0.000000,0> translate<63.500000,-1.535000,38.419100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<78.740000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<78.740000,-1.535000,38.419100>}
box{<0,0,-0.400000><2.220900,0.035000,0.400000> rotate<0,-90.000000,0> translate<78.740000,-1.535000,38.419100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<76.200000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<78.740000,0.000000,48.260000>}
box{<0,0,-0.400000><2.540000,0.035000,0.400000> rotate<0,0.000000,0> translate<76.200000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<78.119300,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<80.010000,0.000000,12.700000>}
box{<0,0,-0.400000><1.890700,0.035000,0.400000> rotate<0,0.000000,0> translate<78.119300,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<78.119300,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<80.010000,-1.535000,12.700000>}
box{<0,0,-0.400000><1.890700,0.035000,0.400000> rotate<0,0.000000,0> translate<78.119300,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<74.930000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<81.031300,0.000000,6.598700>}
box{<0,0,-0.400000><8.628541,0.035000,0.400000> rotate<0,44.997030,0> translate<74.930000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<72.292900,-1.535000,15.583300>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<88.952000,-1.535000,15.583300>}
box{<0,0,-0.400000><16.659100,0.035000,0.400000> rotate<0,0.000000,0> translate<72.292900,-1.535000,15.583300> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<76.200000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<89.295300,0.000000,35.560000>}
box{<0,0,-0.400000><13.095300,0.035000,0.400000> rotate<0,0.000000,0> translate<76.200000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<59.464800,0.000000,25.715200>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<90.169300,0.000000,25.715200>}
box{<0,0,-0.400000><30.704500,0.035000,0.400000> rotate<0,0.000000,0> translate<59.464800,0.000000,25.715200> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<81.031300,0.000000,6.598700>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<90.814000,0.000000,6.598700>}
box{<0,0,-0.400000><9.782700,0.035000,0.400000> rotate<0,0.000000,0> translate<81.031300,0.000000,6.598700> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<90.814000,0.000000,6.598700>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<92.114700,0.000000,7.899400>}
box{<0,0,-0.400000><1.839468,0.035000,0.400000> rotate<0,-44.997030,0> translate<90.814000,0.000000,6.598700> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<88.952000,-1.535000,15.583300>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<92.114700,-1.535000,12.420600>}
box{<0,0,-0.400000><4.472733,0.035000,0.400000> rotate<0,44.997030,0> translate<88.952000,-1.535000,15.583300> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<90.169300,0.000000,25.715200>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<92.114700,0.000000,27.660600>}
box{<0,0,-0.400000><2.751211,0.035000,0.400000> rotate<0,-44.997030,0> translate<90.169300,0.000000,25.715200> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<89.295300,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<92.114700,0.000000,38.379400>}
box{<0,0,-0.400000><3.987234,0.035000,0.400000> rotate<0,-44.997030,0> translate<89.295300,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<71.141000,-1.535000,20.639100>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<92.114700,-1.535000,41.612800>}
box{<0,0,-0.400000><29.661291,0.035000,0.400000> rotate<0,-44.997030,0> translate<71.141000,-1.535000,20.639100> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<92.114700,-1.535000,42.900600>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<92.114700,-1.535000,41.612800>}
box{<0,0,-0.400000><1.287800,0.035000,0.400000> rotate<0,-90.000000,0> translate<92.114700,-1.535000,41.612800> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<92.114700,0.000000,7.899400>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<94.538800,0.000000,7.899400>}
box{<0,0,-0.400000><2.424100,0.035000,0.400000> rotate<0,0.000000,0> translate<92.114700,0.000000,7.899400> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<92.114700,-1.535000,12.420600>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<94.538800,-1.535000,12.420600>}
box{<0,0,-0.400000><2.424100,0.035000,0.400000> rotate<0,0.000000,0> translate<92.114700,-1.535000,12.420600> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<92.114700,0.000000,27.660600>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<94.538800,0.000000,27.660600>}
box{<0,0,-0.400000><2.424100,0.035000,0.400000> rotate<0,0.000000,0> translate<92.114700,0.000000,27.660600> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<92.114700,0.000000,38.379400>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<94.538800,0.000000,38.379400>}
box{<0,0,-0.400000><2.424100,0.035000,0.400000> rotate<0,0.000000,0> translate<92.114700,0.000000,38.379400> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<92.114700,-1.535000,42.900600>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<94.538800,-1.535000,42.900600>}
box{<0,0,-0.400000><2.424100,0.035000,0.400000> rotate<0,0.000000,0> translate<92.114700,-1.535000,42.900600> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<94.538800,-1.535000,23.139400>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<96.962900,-1.535000,23.139400>}
box{<0,0,-0.400000><2.424100,0.035000,0.400000> rotate<0,0.000000,0> translate<94.538800,-1.535000,23.139400> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<94.538800,-1.535000,7.899400>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<98.617100,-1.535000,7.899400>}
box{<0,0,-0.400000><4.078300,0.035000,0.400000> rotate<0,0.000000,0> translate<94.538800,-1.535000,7.899400> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<96.962900,-1.535000,23.139400>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<98.617100,-1.535000,23.139400>}
box{<0,0,-0.400000><1.654200,0.035000,0.400000> rotate<0,0.000000,0> translate<96.962900,-1.535000,23.139400> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<98.617100,-1.535000,7.899400>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<98.617100,-1.535000,23.139400>}
box{<0,0,-0.400000><15.240000,0.035000,0.400000> rotate<0,90.000000,0> translate<98.617100,-1.535000,23.139400> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<94.538800,-1.535000,38.379400>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<98.617100,-1.535000,38.379400>}
box{<0,0,-0.400000><4.078300,0.035000,0.400000> rotate<0,0.000000,0> translate<94.538800,-1.535000,38.379400> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<98.617100,-1.535000,23.139400>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<98.617100,-1.535000,38.379400>}
box{<0,0,-0.400000><15.240000,0.035000,0.400000> rotate<0,90.000000,0> translate<98.617100,-1.535000,38.379400> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<98.617100,-1.535000,7.899400>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<101.041200,-1.535000,7.899400>}
box{<0,0,-0.400000><2.424100,0.035000,0.400000> rotate<0,0.000000,0> translate<98.617100,-1.535000,7.899400> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<94.538800,0.000000,12.420600>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<101.041200,0.000000,12.420600>}
box{<0,0,-0.400000><6.502400,0.035000,0.400000> rotate<0,0.000000,0> translate<94.538800,0.000000,12.420600> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<98.617100,-1.535000,23.139400>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<101.041200,-1.535000,23.139400>}
box{<0,0,-0.400000><2.424100,0.035000,0.400000> rotate<0,0.000000,0> translate<98.617100,-1.535000,23.139400> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<94.538800,0.000000,27.660600>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<101.041200,0.000000,27.660600>}
box{<0,0,-0.400000><6.502400,0.035000,0.400000> rotate<0,0.000000,0> translate<94.538800,0.000000,27.660600> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<98.617100,-1.535000,38.379400>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<101.041200,-1.535000,38.379400>}
box{<0,0,-0.400000><2.424100,0.035000,0.400000> rotate<0,0.000000,0> translate<98.617100,-1.535000,38.379400> }
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<94.538800,0.000000,42.900600>}
cylinder{<0,0,0><0,0.035000,0>0.400000 translate<101.041200,0.000000,42.900600>}
box{<0,0,-0.400000><6.502400,0.035000,0.400000> rotate<0,0.000000,0> translate<94.538800,0.000000,42.900600> }
//Text
//Rect
union{
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygons
texture{col_pol}
}
#end
union{
cylinder{<49.530000,0.038000,29.210000><49.530000,-1.538000,29.210000>0.406400}
cylinder{<49.530000,0.038000,34.290000><49.530000,-1.538000,34.290000>0.406400}
cylinder{<26.670000,0.038000,22.860000><26.670000,-1.538000,22.860000>0.406400}
cylinder{<31.750000,0.038000,22.860000><31.750000,-1.538000,22.860000>0.406400}
cylinder{<39.370000,0.038000,27.940000><39.370000,-1.538000,27.940000>0.406400}
cylinder{<41.910000,0.038000,27.940000><41.910000,-1.538000,27.940000>0.406400}
cylinder{<76.200000,0.038000,40.640000><76.200000,-1.538000,40.640000>0.406400}
cylinder{<76.200000,0.038000,48.260000><76.200000,-1.538000,48.260000>0.406400}
cylinder{<39.370000,0.038000,40.640000><39.370000,-1.538000,40.640000>0.406400}
cylinder{<39.370000,0.038000,48.260000><39.370000,-1.538000,48.260000>0.406400}
cylinder{<35.560000,0.038000,36.830000><35.560000,-1.538000,36.830000>0.558800}
cylinder{<25.400000,0.038000,36.830000><25.400000,-1.538000,36.830000>0.558800}
cylinder{<78.740000,0.038000,40.640000><78.740000,-1.538000,40.640000>0.406400}
cylinder{<78.740000,0.038000,48.260000><78.740000,-1.538000,48.260000>0.406400}
cylinder{<30.480000,0.038000,29.210000><30.480000,-1.538000,29.210000>0.508000}
cylinder{<27.940000,0.038000,29.210000><27.940000,-1.538000,29.210000>0.508000}
cylinder{<33.020000,0.038000,29.210000><33.020000,-1.538000,29.210000>0.508000}
cylinder{<43.180000,0.038000,15.240000><43.180000,-1.538000,15.240000>0.406400}
cylinder{<45.720000,0.038000,15.240000><45.720000,-1.538000,15.240000>0.406400}
cylinder{<48.260000,0.038000,15.240000><48.260000,-1.538000,15.240000>0.406400}
cylinder{<50.800000,0.038000,15.240000><50.800000,-1.538000,15.240000>0.406400}
cylinder{<53.340000,0.038000,15.240000><53.340000,-1.538000,15.240000>0.406400}
cylinder{<55.880000,0.038000,15.240000><55.880000,-1.538000,15.240000>0.406400}
cylinder{<58.420000,0.038000,15.240000><58.420000,-1.538000,15.240000>0.406400}
cylinder{<60.960000,0.038000,15.240000><60.960000,-1.538000,15.240000>0.406400}
cylinder{<63.500000,0.038000,15.240000><63.500000,-1.538000,15.240000>0.406400}
cylinder{<63.500000,0.038000,22.860000><63.500000,-1.538000,22.860000>0.406400}
cylinder{<60.960000,0.038000,22.860000><60.960000,-1.538000,22.860000>0.406400}
cylinder{<58.420000,0.038000,22.860000><58.420000,-1.538000,22.860000>0.406400}
cylinder{<55.880000,0.038000,22.860000><55.880000,-1.538000,22.860000>0.406400}
cylinder{<53.340000,0.038000,22.860000><53.340000,-1.538000,22.860000>0.406400}
cylinder{<50.800000,0.038000,22.860000><50.800000,-1.538000,22.860000>0.406400}
cylinder{<48.260000,0.038000,22.860000><48.260000,-1.538000,22.860000>0.406400}
cylinder{<45.720000,0.038000,22.860000><45.720000,-1.538000,22.860000>0.406400}
cylinder{<43.180000,0.038000,22.860000><43.180000,-1.538000,22.860000>0.406400}
cylinder{<74.930000,0.038000,12.700000><74.930000,-1.538000,12.700000>0.660400}
cylinder{<80.010000,0.038000,12.700000><80.010000,-1.538000,12.700000>0.660400}
cylinder{<77.470000,0.038000,2.540000><77.470000,-1.538000,2.540000>0.660400}
cylinder{<73.660000,0.038000,20.320000><73.660000,-1.538000,20.320000>0.406400}
cylinder{<73.660000,0.038000,30.480000><73.660000,-1.538000,30.480000>0.406400}
cylinder{<64.770000,0.038000,27.940000><64.770000,-1.538000,27.940000>0.406400}
cylinder{<54.610000,0.038000,27.940000><54.610000,-1.538000,27.940000>0.406400}
cylinder{<59.690000,0.038000,30.480000><59.690000,-1.538000,30.480000>0.406400}
cylinder{<69.850000,0.038000,30.480000><69.850000,-1.538000,30.480000>0.406400}
cylinder{<94.538800,0.038000,42.900600><94.538800,-1.538000,42.900600>0.508000}
cylinder{<101.041200,0.038000,42.900600><101.041200,-1.538000,42.900600>0.508000}
cylinder{<94.538800,0.038000,38.379400><94.538800,-1.538000,38.379400>0.508000}
cylinder{<101.041200,0.038000,38.379400><101.041200,-1.538000,38.379400>0.508000}
cylinder{<94.538800,0.038000,27.660600><94.538800,-1.538000,27.660600>0.508000}
cylinder{<101.041200,0.038000,27.660600><101.041200,-1.538000,27.660600>0.508000}
cylinder{<94.538800,0.038000,23.139400><94.538800,-1.538000,23.139400>0.508000}
cylinder{<101.041200,0.038000,23.139400><101.041200,-1.538000,23.139400>0.508000}
cylinder{<94.538800,0.038000,12.420600><94.538800,-1.538000,12.420600>0.508000}
cylinder{<101.041200,0.038000,12.420600><101.041200,-1.538000,12.420600>0.508000}
cylinder{<94.538800,0.038000,7.899400><94.538800,-1.538000,7.899400>0.508000}
cylinder{<101.041200,0.038000,7.899400><101.041200,-1.538000,7.899400>0.508000}
cylinder{<73.660000,0.038000,35.560000><73.660000,-1.538000,35.560000>0.406400}
cylinder{<71.120000,0.038000,35.560000><71.120000,-1.538000,35.560000>0.406400}
cylinder{<76.200000,0.038000,35.560000><76.200000,-1.538000,35.560000>0.406400}
cylinder{<55.880000,0.038000,35.560000><55.880000,-1.538000,35.560000>0.406400}
cylinder{<53.340000,0.038000,35.560000><53.340000,-1.538000,35.560000>0.406400}
cylinder{<58.420000,0.038000,35.560000><58.420000,-1.538000,35.560000>0.406400}
cylinder{<66.040000,0.038000,35.560000><66.040000,-1.538000,35.560000>0.406400}
cylinder{<63.500000,0.038000,35.560000><63.500000,-1.538000,35.560000>0.406400}
cylinder{<68.580000,0.038000,35.560000><68.580000,-1.538000,35.560000>0.406400}
cylinder{<27.760000,0.038000,46.520000><27.760000,-1.538000,46.520000>0.400000}
cylinder{<27.760000,0.038000,44.920000><27.760000,-1.538000,44.920000>0.400000}
cylinder{<25.060000,0.038000,40.120000><25.060000,-1.538000,40.120000>0.400000}
cylinder{<23.460000,0.038000,40.120000><23.460000,-1.538000,40.120000>0.400000}
cylinder{<22.260000,0.038000,42.920000><22.260000,-1.538000,42.920000>0.400000}
cylinder{<20.660000,0.038000,42.920000><20.660000,-1.538000,42.920000>0.400000}
cylinder{<50.800000,0.038000,8.890000><50.800000,-1.538000,8.890000>0.400000}
cylinder{<48.260000,0.038000,8.890000><48.260000,-1.538000,8.890000>0.400000}
cylinder{<45.720000,0.038000,8.890000><45.720000,-1.538000,8.890000>0.400000}
cylinder{<43.180000,0.038000,8.890000><43.180000,-1.538000,8.890000>0.400000}
cylinder{<40.640000,0.038000,8.890000><40.640000,-1.538000,8.890000>0.400000}
cylinder{<38.100000,0.038000,8.890000><38.100000,-1.538000,8.890000>0.400000}
cylinder{<35.560000,0.038000,8.890000><35.560000,-1.538000,8.890000>0.400000}
cylinder{<33.020000,0.038000,8.890000><33.020000,-1.538000,8.890000>0.400000}
cylinder{<30.480000,0.038000,8.890000><30.480000,-1.538000,8.890000>0.400000}
cylinder{<27.940000,0.038000,8.890000><27.940000,-1.538000,8.890000>0.400000}
cylinder{<25.400000,0.038000,8.890000><25.400000,-1.538000,8.890000>0.400000}
cylinder{<22.860000,0.038000,8.890000><22.860000,-1.538000,8.890000>0.400000}
cylinder{<20.320000,0.038000,8.890000><20.320000,-1.538000,8.890000>0.400000}
cylinder{<17.780000,0.038000,8.890000><17.780000,-1.538000,8.890000>0.400000}
cylinder{<53.340000,0.038000,8.890000><53.340000,-1.538000,8.890000>0.400000}
cylinder{<55.880000,0.038000,8.890000><55.880000,-1.538000,8.890000>0.400000}
cylinder{<62.687200,0.038000,45.872400><62.687200,-1.538000,45.872400>0.546100}
cylinder{<59.918600,0.038000,45.872400><59.918600,-1.538000,45.872400>0.546100}
cylinder{<57.150000,0.038000,45.872400><57.150000,-1.538000,45.872400>0.546100}
cylinder{<54.381400,0.038000,45.872400><54.381400,-1.538000,45.872400>0.546100}
cylinder{<51.612800,0.038000,45.872400><51.612800,-1.538000,45.872400>0.546100}
cylinder{<61.302900,0.038000,43.027600><61.302900,-1.538000,43.027600>0.546100}
cylinder{<58.534300,0.038000,43.027600><58.534300,-1.538000,43.027600>0.546100}
cylinder{<55.765700,0.038000,43.027600><55.765700,-1.538000,43.027600>0.546100}
cylinder{<52.997100,0.038000,43.027600><52.997100,-1.538000,43.027600>0.546100}
//Holes(fast)/Vias
cylinder{<66.475000,0.038000,17.041000><66.475000,-1.538000,17.041000>0.304800 }
cylinder{<30.466500,0.038000,36.921600><30.466500,-1.538000,36.921600>0.304800 }
cylinder{<36.830000,0.038000,11.430000><36.830000,-1.538000,11.430000>0.400000 }
cylinder{<39.396100,0.038000,16.699700><39.396100,-1.538000,16.699700>0.304800 }
cylinder{<42.137200,0.038000,12.358600><42.137200,-1.538000,12.358600>0.304800 }
cylinder{<59.464800,0.038000,25.715200><59.464800,-1.538000,25.715200>0.304800 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<48.895000,0.000000,31.445200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<49.530000,0.000000,31.445200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<48.895000,0.000000,31.445200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<49.530000,0.000000,31.445200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<50.165000,0.000000,31.445200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<49.530000,0.000000,31.445200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,31.445200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,30.226000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,-90.000000,0> translate<49.530000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<48.895000,0.000000,32.080200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<49.530000,0.000000,32.080200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<48.895000,0.000000,32.080200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<49.530000,0.000000,32.080200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<50.165000,0.000000,32.080200>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<49.530000,0.000000,32.080200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,32.080200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,33.274000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,90.000000,0> translate<49.530000,0.000000,33.274000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.546000,0.000000,28.067000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.514000,0.000000,28.067000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,28.321000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,35.179000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<50.800000,0.000000,35.179000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.546000,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514000,0.000000,35.433000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.514000,0.000000,35.433000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,35.179000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,28.321000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.260000,0.000000,28.321000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<48.514000,0.000000,35.179000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<50.546000,0.000000,35.179000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<50.546000,0.000000,28.321000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<48.514000,0.000000,28.321000>}
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<28.905200,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<28.905200,0.000000,22.860000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<28.905200,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<28.905200,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<28.905200,0.000000,22.225000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<28.905200,0.000000,22.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.905200,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.686000,0.000000,22.860000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,0.000000,0> translate<27.686000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<29.540200,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<29.540200,0.000000,22.860000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<29.540200,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<29.540200,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<29.540200,0.000000,22.225000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<29.540200,0.000000,22.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.540200,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.734000,0.000000,22.860000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,0.000000,0> translate<29.540200,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.527000,0.000000,21.844000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.527000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.639000,0.000000,21.590000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.781000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,23.876000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<32.893000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.639000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,24.130000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.781000,0.000000,24.130000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<32.639000,0.000000,23.876000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<32.639000,0.000000,21.844000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<25.781000,0.000000,21.844000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<25.781000,0.000000,23.876000>}
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.592000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.354000,0.000000,27.940000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.592000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.973000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.973000,0.000000,28.321000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<37.973000,0.000000,28.321000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.989000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.878000,0.000000,27.940000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.989000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.878000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.878000,0.000000,26.670000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.878000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.878000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,26.670000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.878000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,29.210000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<40.386000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.878000,0.000000,29.210000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.878000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.878000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.878000,0.000000,27.940000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.878000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,27.940000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.275000,0.000000,27.940000> }
difference{
cylinder{<40.640000,0,27.940000><40.640000,0.036000,27.940000>3.505200 translate<0,0.000000,0>}
cylinder{<40.640000,-0.1,27.940000><40.640000,0.135000,27.940000>3.352800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-0.000000,0> translate<41.148000,0.000000,27.940000>}
//D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<76.200000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<76.200000,0.000000,41.529000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<76.200000,0.000000,41.529000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<76.200000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<76.200000,0.000000,47.371000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<76.200000,0.000000,47.371000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.200000,0.000000,45.085000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.200000,0.000000,44.450000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<76.200000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.835000,0.000000,43.434000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.565000,0.000000,43.434000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<75.565000,0.000000,43.434000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.565000,0.000000,43.434000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.200000,0.000000,44.450000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-57.990789,0> translate<75.565000,0.000000,43.434000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.200000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.200000,0.000000,42.926000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<76.200000,0.000000,42.926000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.200000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.835000,0.000000,43.434000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,57.990789,0> translate<76.200000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.835000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.200000,0.000000,44.450000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.200000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.200000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.565000,0.000000,44.450000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<75.565000,0.000000,44.450000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<76.962000,0.000000,42.418000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.962000,0.000000,42.164000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.438000,0.000000,42.164000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<75.438000,0.000000,42.164000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<75.438000,0.000000,42.418000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<76.962000,0.000000,46.482000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<75.438000,0.000000,46.482000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.184000,0.000000,46.482000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.184000,0.000000,42.418000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<75.184000,0.000000,42.418000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.962000,0.000000,46.736000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.438000,0.000000,46.736000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<75.438000,0.000000,46.736000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.216000,0.000000,46.482000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.216000,0.000000,42.418000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<77.216000,0.000000,42.418000> }
box{<-0.254000,0,-1.016000><0.254000,0.036000,1.016000> rotate<0,-270.000000,0> translate<76.200000,0.000000,46.101000>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-270.000000,0> translate<76.200000,0.000000,41.846500>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-270.000000,0> translate<76.200000,0.000000,47.053500>}
//D2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<39.370000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<39.370000,0.000000,41.529000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<39.370000,0.000000,41.529000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<39.370000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<39.370000,0.000000,47.371000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<39.370000,0.000000,47.371000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,45.085000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,44.450000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.370000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,43.434000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,43.434000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.735000,0.000000,43.434000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,43.434000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,44.450000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-57.990789,0> translate<38.735000,0.000000,43.434000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,42.926000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.370000,0.000000,42.926000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,43.434000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,57.990789,0> translate<39.370000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,44.450000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.370000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,44.450000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.735000,0.000000,44.450000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<40.132000,0.000000,42.418000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.132000,0.000000,42.164000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.608000,0.000000,42.164000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.608000,0.000000,42.164000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<38.608000,0.000000,42.418000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<40.132000,0.000000,46.482000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<38.608000,0.000000,46.482000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.354000,0.000000,46.482000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.354000,0.000000,42.418000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.354000,0.000000,42.418000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.132000,0.000000,46.736000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.608000,0.000000,46.736000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.608000,0.000000,46.736000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,46.482000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,42.418000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.386000,0.000000,42.418000> }
box{<-0.254000,0,-1.016000><0.254000,0.036000,1.016000> rotate<0,-270.000000,0> translate<39.370000,0.000000,46.101000>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-270.000000,0> translate<39.370000,0.000000,41.846500>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-270.000000,0> translate<39.370000,0.000000,47.053500>}
//D3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.512000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.448000,0.000000,35.560000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.448000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.512000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.512000,0.000000,38.100000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<32.512000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.448000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.512000,0.000000,38.100000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.448000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.448000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.448000,0.000000,35.560000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.448000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.036000,0>0.381000 translate<35.560000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.381000 translate<34.544000,0.000000,36.830000>}
box{<0,0,-0.381000><1.016000,0.036000,0.381000> rotate<0,0.000000,0> translate<34.544000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.381000 translate<25.400000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.381000 translate<26.416000,0.000000,36.830000>}
box{<0,0,-0.381000><1.016000,0.036000,0.381000> rotate<0,0.000000,0> translate<25.400000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.480000,0.000000,36.830000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.845000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.496000,0.000000,37.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.496000,0.000000,36.195000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.496000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.496000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.480000,0.000000,36.830000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,32.003271,0> translate<30.480000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.480000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.004000,0.000000,36.830000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.480000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.480000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.496000,0.000000,37.465000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-32.003271,0> translate<30.480000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.480000,0.000000,37.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.480000,0.000000,36.830000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.480000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.480000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.480000,0.000000,36.195000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.480000,0.000000,36.195000> }
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-0.000000,0> translate<29.083000,0.000000,36.830000>}
box{<-0.952500,0,-0.381000><0.952500,0.036000,0.381000> rotate<0,-0.000000,0> translate<33.464500,0.000000,36.830000>}
box{<-0.952500,0,-0.381000><0.952500,0.036000,0.381000> rotate<0,-0.000000,0> translate<27.495500,0.000000,36.830000>}
//D4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<78.740000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<78.740000,0.000000,41.529000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<78.740000,0.000000,41.529000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<78.740000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<78.740000,0.000000,47.371000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<78.740000,0.000000,47.371000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.740000,0.000000,45.085000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.740000,0.000000,44.450000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<78.740000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.375000,0.000000,43.434000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,43.434000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<78.105000,0.000000,43.434000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,43.434000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.740000,0.000000,44.450000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-57.990789,0> translate<78.105000,0.000000,43.434000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.740000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.740000,0.000000,42.926000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<78.740000,0.000000,42.926000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.740000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.375000,0.000000,43.434000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,57.990789,0> translate<78.740000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.375000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.740000,0.000000,44.450000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<78.740000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.740000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,44.450000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<78.105000,0.000000,44.450000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<79.502000,0.000000,42.418000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.502000,0.000000,42.164000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.978000,0.000000,42.164000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<77.978000,0.000000,42.164000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<77.978000,0.000000,42.418000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<79.502000,0.000000,46.482000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<77.978000,0.000000,46.482000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.724000,0.000000,46.482000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.724000,0.000000,42.418000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<77.724000,0.000000,42.418000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.502000,0.000000,46.736000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.978000,0.000000,46.736000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<77.978000,0.000000,46.736000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.756000,0.000000,46.482000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.756000,0.000000,42.418000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<79.756000,0.000000,42.418000> }
box{<-0.254000,0,-1.016000><0.254000,0.036000,1.016000> rotate<0,-270.000000,0> translate<78.740000,0.000000,46.101000>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-270.000000,0> translate<78.740000,0.000000,41.846500>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-270.000000,0> translate<78.740000,0.000000,47.053500>}
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.306000,-1.536000,30.988000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.560000,-1.536000,30.734000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<35.306000,-1.536000,30.988000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.306000,-1.536000,30.988000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.654000,-1.536000,30.988000>}
box{<0,0,-0.076200><9.652000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.654000,-1.536000,30.988000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.400000,-1.536000,30.734000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.654000,-1.536000,30.988000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<25.400000,-1.536000,30.734000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.560000,-1.536000,27.813000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.560000,-1.536000,30.734000>}
box{<0,0,-0.076200><2.921000,0.036000,0.076200> rotate<0,90.000000,0> translate<35.560000,-1.536000,30.734000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.400000,-1.536000,30.734000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.400000,-1.536000,27.813000>}
box{<0,0,-0.076200><2.921000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.400000,-1.536000,27.813000> }
difference{
cylinder{<25.857200,0,30.378400><25.857200,0.036000,30.378400>0.254000 translate<0,-1.536000,0>}
cylinder{<25.857200,-0.1,30.378400><25.857200,0.135000,30.378400>0.254000 translate<0,-1.536000,0>}}
box{<-0.952500,0,-0.635000><0.952500,0.036000,0.635000> rotate<0,-0.000000,0> translate<26.098500,-1.536000,27.305000>}
box{<-0.889000,0,-0.381000><0.889000,0.036000,0.381000> rotate<0,-0.000000,0> translate<27.940000,-1.536000,27.051000>}
box{<-0.381000,0,-0.635000><0.381000,0.036000,0.635000> rotate<0,-0.000000,0> translate<29.210000,-1.536000,27.305000>}
box{<-0.889000,0,-0.381000><0.889000,0.036000,0.381000> rotate<0,-0.000000,0> translate<30.480000,-1.536000,27.051000>}
box{<-0.381000,0,-0.635000><0.381000,0.036000,0.635000> rotate<0,-0.000000,0> translate<31.750000,-1.536000,27.305000>}
box{<-0.889000,0,-0.381000><0.889000,0.036000,0.381000> rotate<0,-0.000000,0> translate<33.020000,-1.536000,27.051000>}
box{<-0.952500,0,-0.635000><0.952500,0.036000,0.635000> rotate<0,-0.000000,0> translate<34.861500,-1.536000,27.305000>}
box{<-0.889000,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-0.000000,0> translate<27.940000,-1.536000,27.686000>}
box{<-0.889000,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-0.000000,0> translate<30.480000,-1.536000,27.686000>}
box{<-0.889000,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-0.000000,0> translate<33.020000,-1.536000,27.686000>}
//IC2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,16.510000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.910000,0.000000,16.510000> }
object{ARC(0.635000,0.152400,270.000000,450.000000,0.036000) translate<41.910000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,16.510000>}
box{<0,0,-0.076200><22.860000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.910000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,21.590000>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,90.000000,0> translate<64.770000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,21.590000>}
box{<0,0,-0.076200><22.860000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.910000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,19.685000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.910000,0.000000,19.685000> }
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.089000,-1.536000,7.239000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.089000,-1.536000,5.969000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<77.089000,-1.536000,5.969000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.089000,-1.536000,5.969000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.851000,-1.536000,5.969000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<77.089000,-1.536000,5.969000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.851000,-1.536000,5.969000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.851000,-1.536000,7.239000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<77.851000,-1.536000,7.239000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.851000,-1.536000,7.239000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.486000,-1.536000,7.747000>}
box{<0,0,-0.076200><0.813197,0.036000,0.076200> rotate<0,-38.657257,0> translate<77.851000,-1.536000,7.239000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.486000,-1.536000,7.747000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.486000,-1.536000,8.001000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<78.486000,-1.536000,8.001000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.486000,-1.536000,8.001000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.851000,-1.536000,8.001000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<77.851000,-1.536000,8.001000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.851000,-1.536000,8.001000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.851000,-1.536000,9.271000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<77.851000,-1.536000,9.271000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.851000,-1.536000,9.271000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.089000,-1.536000,9.271000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<77.089000,-1.536000,9.271000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.089000,-1.536000,9.271000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.089000,-1.536000,8.001000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<77.089000,-1.536000,8.001000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.089000,-1.536000,8.001000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.454000,-1.536000,8.001000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.454000,-1.536000,8.001000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.454000,-1.536000,8.001000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.454000,-1.536000,7.747000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<76.454000,-1.536000,7.747000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.454000,-1.536000,7.747000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.089000,-1.536000,7.239000>}
box{<0,0,-0.076200><0.813197,0.036000,0.076200> rotate<0,38.657257,0> translate<76.454000,-1.536000,7.747000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.994000,-1.536000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.946000,-1.536000,2.540000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<75.946000,-1.536000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.042000,-1.536000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.994000,-1.536000,2.540000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<78.994000,-1.536000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.946000,-1.536000,9.144000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.438000,-1.536000,9.652000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,44.997030,0> translate<75.438000,-1.536000,9.652000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.994000,-1.536000,9.144000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.502000,-1.536000,9.652000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,-44.997030,0> translate<78.994000,-1.536000,9.144000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.549000,-1.536000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.057000,-1.536000,7.620000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<74.549000,-1.536000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.883000,-1.536000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.391000,-1.536000,7.620000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<79.883000,-1.536000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.692000,-1.536000,5.842000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.438000,-1.536000,5.588000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<75.438000,-1.536000,5.588000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.248000,-1.536000,5.842000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.502000,-1.536000,5.588000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<79.248000,-1.536000,5.842000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.470000,-1.536000,5.207000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.470000,-1.536000,4.699000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<77.470000,-1.536000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.407000,-1.536000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.613000,-1.536000,12.700000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<78.613000,-1.536000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.613000,-1.536000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.327000,-1.536000,12.700000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.327000,-1.536000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.327000,-1.536000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.533000,-1.536000,12.700000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<73.533000,-1.536000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.533000,-1.536000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.898000,-1.536000,12.700000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<72.898000,-1.536000,12.700000> }
object{ARC(0.381000,0.152400,0.000000,90.000000,0.036000) translate<82.042000,-1.536000,12.319000>}
object{ARC(0.381000,0.152400,270.000000,360.000000,0.036000) translate<82.042000,-1.536000,2.921000>}
object{ARC(0.381000,0.152400,180.000000,270.000000,0.036000) translate<72.898000,-1.536000,2.921000>}
object{ARC(0.381000,0.152400,90.000000,180.000000,0.036000) translate<72.898000,-1.536000,12.319000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.042000,-1.536000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.407000,-1.536000,12.700000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<81.407000,-1.536000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.423000,-1.536000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.423000,-1.536000,12.319000>}
box{<0,0,-0.076200><9.398000,0.036000,0.076200> rotate<0,90.000000,0> translate<82.423000,-1.536000,12.319000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.898000,-1.536000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.946000,-1.536000,2.540000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<72.898000,-1.536000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.517000,-1.536000,12.319000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.517000,-1.536000,2.921000>}
box{<0,0,-0.076200><9.398000,0.036000,0.076200> rotate<0,-90.000000,0> translate<72.517000,-1.536000,2.921000> }
difference{
cylinder{<77.470000,0,7.620000><77.470000,0.036000,7.620000>2.108200 translate<0,-1.536000,0>}
cylinder{<77.470000,-0.1,7.620000><77.470000,0.135000,7.620000>1.955800 translate<0,-1.536000,0>}}
difference{
cylinder{<77.470000,0,7.620000><77.470000,0.036000,7.620000>2.997200 translate<0,-1.536000,0>}
cylinder{<77.470000,-0.1,7.620000><77.470000,0.135000,7.620000>2.844800 translate<0,-1.536000,0>}}
box{<-0.508000,0,-0.190500><0.508000,0.036000,0.190500> rotate<0,-0.000000,0> translate<77.470000,-1.536000,2.349500>}
box{<-0.508000,0,-0.889000><0.508000,0.036000,0.889000> rotate<0,-0.000000,0> translate<80.010000,-1.536000,12.192000>}
box{<-1.587500,0,-0.508000><1.587500,0.036000,0.508000> rotate<0,-0.000000,0> translate<80.454500,-1.536000,10.795000>}
box{<-0.762000,0,-1.333500><0.762000,0.036000,1.333500> rotate<0,-0.000000,0> translate<81.280000,-1.536000,8.953500>}
box{<-0.762000,0,-1.333500><0.762000,0.036000,1.333500> rotate<0,-0.000000,0> translate<73.660000,-1.536000,8.953500>}
box{<-1.587500,0,-0.508000><1.587500,0.036000,0.508000> rotate<0,-0.000000,0> translate<74.485500,-1.536000,10.795000>}
box{<-0.508000,0,-0.889000><0.508000,0.036000,0.889000> rotate<0,-0.000000,0> translate<74.930000,-1.536000,12.192000>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<73.660000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<73.660000,0.000000,29.464000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<73.660000,0.000000,29.464000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<73.660000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<73.660000,0.000000,21.336000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<73.660000,0.000000,21.336000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<72.771000,0.000000,22.479000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<74.549000,0.000000,22.479000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<74.549000,0.000000,28.321000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<72.771000,0.000000,28.321000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.549000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.771000,0.000000,22.225000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<72.771000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.517000,0.000000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.517000,0.000000,22.860000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<72.517000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.644000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.517000,0.000000,22.860000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<72.517000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.803000,0.000000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.803000,0.000000,22.860000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<74.803000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.676000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.803000,0.000000,22.860000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<74.676000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.644000,0.000000,27.813000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.517000,0.000000,27.940000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<72.517000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.644000,0.000000,27.813000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.644000,0.000000,22.987000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<72.644000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.676000,0.000000,27.813000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.803000,0.000000,27.940000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<74.676000,0.000000,27.813000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.676000,0.000000,27.813000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.676000,0.000000,22.987000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<74.676000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.517000,0.000000,28.321000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.517000,0.000000,27.940000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<72.517000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.803000,0.000000,28.321000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.803000,0.000000,27.940000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<74.803000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.549000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.771000,0.000000,28.575000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<72.771000,0.000000,28.575000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<73.660000,0.000000,29.006800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<73.660000,0.000000,21.793200>}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<54.610000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<55.626000,0.000000,27.940000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<54.610000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<64.770000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<63.754000,0.000000,27.940000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<63.754000,0.000000,27.940000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<62.611000,0.000000,27.051000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<62.611000,0.000000,28.829000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<56.769000,0.000000,28.829000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<56.769000,0.000000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,28.829000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,27.051000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<62.865000,0.000000,27.051000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.611000,0.000000,26.797000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,26.797000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.230000,0.000000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.103000,0.000000,26.924000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,26.797000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<62.103000,0.000000,26.924000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.611000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,29.083000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.230000,0.000000,29.083000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.103000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,29.083000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<62.103000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.277000,0.000000,26.924000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,26.797000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<57.150000,0.000000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.277000,0.000000,26.924000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.103000,0.000000,26.924000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.277000,0.000000,26.924000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.277000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,29.083000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<57.150000,0.000000,29.083000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.277000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.103000,0.000000,28.956000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.277000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.769000,0.000000,26.797000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,26.797000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.769000,0.000000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.769000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,29.083000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.769000,0.000000,29.083000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,28.829000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,27.051000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<56.515000,0.000000,27.051000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<56.083200,0.000000,27.940000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<63.296800,0.000000,27.940000>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<69.850000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<68.834000,0.000000,30.480000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<68.834000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<59.690000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<60.706000,0.000000,30.480000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<59.690000,0.000000,30.480000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<61.849000,0.000000,31.369000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<61.849000,0.000000,29.591000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<67.691000,0.000000,29.591000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<67.691000,0.000000,31.369000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,31.369000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<61.595000,0.000000,31.369000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.849000,0.000000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,31.623000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.849000,0.000000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,31.623000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<62.230000,0.000000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.849000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,29.337000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.849000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,0.000000,29.464000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,29.337000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<62.230000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.183000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.310000,0.000000,31.623000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<67.183000,0.000000,31.496000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.183000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,0.000000,31.496000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.357000,0.000000,31.496000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.183000,0.000000,29.464000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.310000,0.000000,29.337000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<67.183000,0.000000,29.464000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.183000,0.000000,29.464000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,0.000000,29.464000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.357000,0.000000,29.464000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.691000,0.000000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.310000,0.000000,31.623000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<67.310000,0.000000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.691000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.310000,0.000000,29.337000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<67.310000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.945000,0.000000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.945000,0.000000,31.369000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<67.945000,0.000000,31.369000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<68.376800,0.000000,30.480000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<61.163200,0.000000,30.480000>}
//S1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<101.092000,0.000000,39.878000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,39.878000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<100.838000,0.000000,39.878000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<101.092000,0.000000,39.878000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<101.092000,0.000000,41.402000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<101.092000,0.000000,41.402000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,41.402000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<101.092000,0.000000,41.402000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<100.838000,0.000000,41.402000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,41.656000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,43.180000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<100.838000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.488000,0.000000,41.402000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,41.402000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<94.488000,0.000000,41.402000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.488000,0.000000,41.402000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.488000,0.000000,39.878000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<94.488000,0.000000,39.878000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,39.878000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.488000,0.000000,39.878000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<94.488000,0.000000,39.878000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.330000,0.000000,43.688000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,44.997030,0> translate<100.330000,0.000000,43.688000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.330000,0.000000,37.592000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,38.100000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,-44.997030,0> translate<100.330000,0.000000,37.592000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,39.624000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<100.838000,0.000000,39.624000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.250000,0.000000,43.688000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,43.180000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,-44.997030,0> translate<94.742000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,41.656000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<94.742000,0.000000,41.656000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.250000,0.000000,37.592000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,38.100000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,44.997030,0> translate<94.742000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,39.624000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<94.742000,0.000000,39.624000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<96.520000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<96.520000,0.000000,39.370000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,-90.000000,0> translate<96.520000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<99.060000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<96.520000,0.000000,39.370000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,0.000000,0> translate<96.520000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<99.060000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<99.060000,0.000000,41.910000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,90.000000,0> translate<99.060000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<96.520000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<99.060000,0.000000,41.910000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,0.000000,0> translate<96.520000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<96.520000,0.000000,43.688000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<96.520000,0.000000,43.434000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,-90.000000,0> translate<96.520000,0.000000,43.434000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<99.060000,0.000000,43.434000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<96.520000,0.000000,43.434000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,0.000000,0> translate<96.520000,0.000000,43.434000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<99.060000,0.000000,43.434000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<99.060000,0.000000,43.688000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,90.000000,0> translate<99.060000,0.000000,43.688000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<98.933000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<96.520000,0.000000,37.846000>}
box{<0,0,-0.025400><2.413000,0.036000,0.025400> rotate<0,0.000000,0> translate<96.520000,0.000000,37.846000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<98.933000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<98.933000,0.000000,37.592000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,-90.000000,0> translate<98.933000,0.000000,37.592000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<96.520000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<96.520000,0.000000,37.592000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,-90.000000,0> translate<96.520000,0.000000,37.592000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.330000,0.000000,37.592000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.949000,0.000000,37.592000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<99.949000,0.000000,37.592000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.250000,0.000000,37.592000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.631000,0.000000,37.592000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<95.250000,0.000000,37.592000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.631000,0.000000,37.592000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.520000,0.000000,37.592000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<95.631000,0.000000,37.592000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.250000,0.000000,43.688000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.631000,0.000000,43.688000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<95.250000,0.000000,43.688000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.330000,0.000000,43.688000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.949000,0.000000,43.688000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<99.949000,0.000000,43.688000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.949000,0.000000,43.688000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.060000,0.000000,43.688000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<99.060000,0.000000,43.688000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.060000,0.000000,43.688000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.520000,0.000000,43.688000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<96.520000,0.000000,43.688000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.520000,0.000000,43.688000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.631000,0.000000,43.688000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<95.631000,0.000000,43.688000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.520000,0.000000,37.592000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.933000,0.000000,37.592000>}
box{<0,0,-0.076200><2.413000,0.036000,0.076200> rotate<0,0.000000,0> translate<96.520000,0.000000,37.592000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.933000,0.000000,37.592000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.949000,0.000000,37.592000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<98.933000,0.000000,37.592000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,39.878000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,39.624000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<100.838000,0.000000,39.624000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,41.402000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,41.656000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<100.838000,0.000000,41.656000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,39.878000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,39.624000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<94.742000,0.000000,39.624000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,41.402000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,41.656000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<94.742000,0.000000,41.656000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.520000,0.000000,38.481000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.060000,0.000000,38.481000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<96.520000,0.000000,38.481000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.060000,0.000000,42.926000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.520000,0.000000,42.926000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<96.520000,0.000000,42.926000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.377000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.377000,0.000000,41.148000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<95.377000,0.000000,41.148000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.377000,0.000000,40.132000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.377000,0.000000,39.370000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<95.377000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.377000,0.000000,41.148000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.631000,0.000000,40.259000>}
box{<0,0,-0.076200><0.924574,0.036000,0.076200> rotate<0,74.049717,0> translate<95.377000,0.000000,41.148000> }
difference{
cylinder{<97.790000,0,40.640000><97.790000,0.036000,40.640000>1.854200 translate<0,0.000000,0>}
cylinder{<97.790000,-0.1,40.640000><97.790000,0.135000,40.640000>1.701800 translate<0,0.000000,0>}}
difference{
cylinder{<95.631000,0,38.481000><95.631000,0.036000,38.481000>0.584200 translate<0,0.000000,0>}
cylinder{<95.631000,-0.1,38.481000><95.631000,0.135000,38.481000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<99.949000,0,38.608000><99.949000,0.036000,38.608000>0.584200 translate<0,0.000000,0>}
cylinder{<99.949000,-0.1,38.608000><99.949000,0.135000,38.608000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<99.949000,0,42.799000><99.949000,0.036000,42.799000>0.584200 translate<0,0.000000,0>}
cylinder{<99.949000,-0.1,42.799000><99.949000,0.135000,42.799000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<95.631000,0,42.799000><95.631000,0.036000,42.799000>0.584200 translate<0,0.000000,0>}
cylinder{<95.631000,-0.1,42.799000><95.631000,0.135000,42.799000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<97.790000,0,40.640000><97.790000,0.036000,40.640000>0.660400 translate<0,0.000000,0>}
cylinder{<97.790000,-0.1,40.640000><97.790000,0.135000,40.640000>0.609600 translate<0,0.000000,0>}}
difference{
cylinder{<97.790000,0,40.640000><97.790000,0.036000,40.640000>0.330200 translate<0,0.000000,0>}
cylinder{<97.790000,-0.1,40.640000><97.790000,0.135000,40.640000>0.177800 translate<0,0.000000,0>}}
//S2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<101.092000,0.000000,24.638000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,24.638000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<100.838000,0.000000,24.638000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<101.092000,0.000000,24.638000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<101.092000,0.000000,26.162000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<101.092000,0.000000,26.162000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<101.092000,0.000000,26.162000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<100.838000,0.000000,26.162000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,27.940000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<100.838000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.488000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,26.162000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<94.488000,0.000000,26.162000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.488000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.488000,0.000000,24.638000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<94.488000,0.000000,24.638000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,24.638000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.488000,0.000000,24.638000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<94.488000,0.000000,24.638000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.330000,0.000000,28.448000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,44.997030,0> translate<100.330000,0.000000,28.448000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.330000,0.000000,22.352000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,22.860000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,-44.997030,0> translate<100.330000,0.000000,22.352000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,24.384000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<100.838000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.250000,0.000000,28.448000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,27.940000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,-44.997030,0> translate<94.742000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,26.416000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<94.742000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.250000,0.000000,22.352000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,22.860000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,44.997030,0> translate<94.742000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,24.384000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<94.742000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<96.520000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<96.520000,0.000000,24.130000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,-90.000000,0> translate<96.520000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<99.060000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<96.520000,0.000000,24.130000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,0.000000,0> translate<96.520000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<99.060000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<99.060000,0.000000,26.670000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,90.000000,0> translate<99.060000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<96.520000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<99.060000,0.000000,26.670000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,0.000000,0> translate<96.520000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<96.520000,0.000000,28.448000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<96.520000,0.000000,28.194000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,-90.000000,0> translate<96.520000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<99.060000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<96.520000,0.000000,28.194000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,0.000000,0> translate<96.520000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<99.060000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<99.060000,0.000000,28.448000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,90.000000,0> translate<99.060000,0.000000,28.448000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<98.933000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<96.520000,0.000000,22.606000>}
box{<0,0,-0.025400><2.413000,0.036000,0.025400> rotate<0,0.000000,0> translate<96.520000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<98.933000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<98.933000,0.000000,22.352000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,-90.000000,0> translate<98.933000,0.000000,22.352000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<96.520000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<96.520000,0.000000,22.352000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,-90.000000,0> translate<96.520000,0.000000,22.352000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.330000,0.000000,22.352000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.949000,0.000000,22.352000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<99.949000,0.000000,22.352000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.250000,0.000000,22.352000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.631000,0.000000,22.352000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<95.250000,0.000000,22.352000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.631000,0.000000,22.352000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.520000,0.000000,22.352000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<95.631000,0.000000,22.352000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.250000,0.000000,28.448000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.631000,0.000000,28.448000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<95.250000,0.000000,28.448000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.330000,0.000000,28.448000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.949000,0.000000,28.448000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<99.949000,0.000000,28.448000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.949000,0.000000,28.448000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.060000,0.000000,28.448000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<99.060000,0.000000,28.448000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.060000,0.000000,28.448000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.520000,0.000000,28.448000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<96.520000,0.000000,28.448000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.520000,0.000000,28.448000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.631000,0.000000,28.448000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<95.631000,0.000000,28.448000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.520000,0.000000,22.352000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.933000,0.000000,22.352000>}
box{<0,0,-0.076200><2.413000,0.036000,0.076200> rotate<0,0.000000,0> translate<96.520000,0.000000,22.352000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.933000,0.000000,22.352000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.949000,0.000000,22.352000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<98.933000,0.000000,22.352000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,24.638000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,24.384000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<100.838000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,26.416000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<100.838000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,24.638000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,24.384000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<94.742000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,26.416000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<94.742000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.520000,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.060000,0.000000,23.241000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<96.520000,0.000000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.060000,0.000000,27.686000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.520000,0.000000,27.686000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<96.520000,0.000000,27.686000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.377000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.377000,0.000000,25.908000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<95.377000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.377000,0.000000,24.892000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.377000,0.000000,24.130000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<95.377000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.377000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.631000,0.000000,25.019000>}
box{<0,0,-0.076200><0.924574,0.036000,0.076200> rotate<0,74.049717,0> translate<95.377000,0.000000,25.908000> }
difference{
cylinder{<97.790000,0,25.400000><97.790000,0.036000,25.400000>1.854200 translate<0,0.000000,0>}
cylinder{<97.790000,-0.1,25.400000><97.790000,0.135000,25.400000>1.701800 translate<0,0.000000,0>}}
difference{
cylinder{<95.631000,0,23.241000><95.631000,0.036000,23.241000>0.584200 translate<0,0.000000,0>}
cylinder{<95.631000,-0.1,23.241000><95.631000,0.135000,23.241000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<99.949000,0,23.368000><99.949000,0.036000,23.368000>0.584200 translate<0,0.000000,0>}
cylinder{<99.949000,-0.1,23.368000><99.949000,0.135000,23.368000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<99.949000,0,27.559000><99.949000,0.036000,27.559000>0.584200 translate<0,0.000000,0>}
cylinder{<99.949000,-0.1,27.559000><99.949000,0.135000,27.559000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<95.631000,0,27.559000><95.631000,0.036000,27.559000>0.584200 translate<0,0.000000,0>}
cylinder{<95.631000,-0.1,27.559000><95.631000,0.135000,27.559000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<97.790000,0,25.400000><97.790000,0.036000,25.400000>0.660400 translate<0,0.000000,0>}
cylinder{<97.790000,-0.1,25.400000><97.790000,0.135000,25.400000>0.609600 translate<0,0.000000,0>}}
difference{
cylinder{<97.790000,0,25.400000><97.790000,0.036000,25.400000>0.330200 translate<0,0.000000,0>}
cylinder{<97.790000,-0.1,25.400000><97.790000,0.135000,25.400000>0.177800 translate<0,0.000000,0>}}
//S3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<101.092000,0.000000,9.398000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,9.398000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<100.838000,0.000000,9.398000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<101.092000,0.000000,9.398000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<101.092000,0.000000,10.922000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<101.092000,0.000000,10.922000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,10.922000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<101.092000,0.000000,10.922000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<100.838000,0.000000,10.922000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,11.176000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,12.700000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<100.838000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.488000,0.000000,10.922000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,10.922000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<94.488000,0.000000,10.922000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.488000,0.000000,10.922000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.488000,0.000000,9.398000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<94.488000,0.000000,9.398000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,9.398000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.488000,0.000000,9.398000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<94.488000,0.000000,9.398000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.330000,0.000000,13.208000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,44.997030,0> translate<100.330000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.330000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,7.620000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,-44.997030,0> translate<100.330000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,9.144000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<100.838000,0.000000,9.144000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.250000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,12.700000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,-44.997030,0> translate<94.742000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,11.176000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<94.742000,0.000000,11.176000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.250000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,7.620000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,44.997030,0> translate<94.742000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,9.144000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<94.742000,0.000000,9.144000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<96.520000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<96.520000,0.000000,8.890000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,-90.000000,0> translate<96.520000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<99.060000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<96.520000,0.000000,8.890000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,0.000000,0> translate<96.520000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<99.060000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<99.060000,0.000000,11.430000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,90.000000,0> translate<99.060000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<96.520000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<99.060000,0.000000,11.430000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,0.000000,0> translate<96.520000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<96.520000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<96.520000,0.000000,12.954000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,-90.000000,0> translate<96.520000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<99.060000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<96.520000,0.000000,12.954000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,0.000000,0> translate<96.520000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<99.060000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<99.060000,0.000000,13.208000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,90.000000,0> translate<99.060000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<98.933000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<96.520000,0.000000,7.366000>}
box{<0,0,-0.025400><2.413000,0.036000,0.025400> rotate<0,0.000000,0> translate<96.520000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<98.933000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<98.933000,0.000000,7.112000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,-90.000000,0> translate<98.933000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<96.520000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<96.520000,0.000000,7.112000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,-90.000000,0> translate<96.520000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.330000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.949000,0.000000,7.112000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<99.949000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.250000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.631000,0.000000,7.112000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<95.250000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.631000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.520000,0.000000,7.112000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<95.631000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.250000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.631000,0.000000,13.208000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<95.250000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.330000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.949000,0.000000,13.208000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<99.949000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.949000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.060000,0.000000,13.208000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<99.060000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.060000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.520000,0.000000,13.208000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<96.520000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.520000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.631000,0.000000,13.208000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<95.631000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.520000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.933000,0.000000,7.112000>}
box{<0,0,-0.076200><2.413000,0.036000,0.076200> rotate<0,0.000000,0> translate<96.520000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.933000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.949000,0.000000,7.112000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<98.933000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,9.398000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,9.144000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<100.838000,0.000000,9.144000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,10.922000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.838000,0.000000,11.176000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<100.838000,0.000000,11.176000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,9.398000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,9.144000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<94.742000,0.000000,9.144000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,10.922000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,11.176000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<94.742000,0.000000,11.176000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.520000,0.000000,8.001000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.060000,0.000000,8.001000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<96.520000,0.000000,8.001000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.060000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.520000,0.000000,12.446000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<96.520000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.377000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.377000,0.000000,10.668000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<95.377000,0.000000,10.668000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.377000,0.000000,9.652000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.377000,0.000000,8.890000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<95.377000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.377000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.631000,0.000000,9.779000>}
box{<0,0,-0.076200><0.924574,0.036000,0.076200> rotate<0,74.049717,0> translate<95.377000,0.000000,10.668000> }
difference{
cylinder{<97.790000,0,10.160000><97.790000,0.036000,10.160000>1.854200 translate<0,0.000000,0>}
cylinder{<97.790000,-0.1,10.160000><97.790000,0.135000,10.160000>1.701800 translate<0,0.000000,0>}}
difference{
cylinder{<95.631000,0,8.001000><95.631000,0.036000,8.001000>0.584200 translate<0,0.000000,0>}
cylinder{<95.631000,-0.1,8.001000><95.631000,0.135000,8.001000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<99.949000,0,8.128000><99.949000,0.036000,8.128000>0.584200 translate<0,0.000000,0>}
cylinder{<99.949000,-0.1,8.128000><99.949000,0.135000,8.128000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<99.949000,0,12.319000><99.949000,0.036000,12.319000>0.584200 translate<0,0.000000,0>}
cylinder{<99.949000,-0.1,12.319000><99.949000,0.135000,12.319000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<95.631000,0,12.319000><95.631000,0.036000,12.319000>0.584200 translate<0,0.000000,0>}
cylinder{<95.631000,-0.1,12.319000><95.631000,0.135000,12.319000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<97.790000,0,10.160000><97.790000,0.036000,10.160000>0.660400 translate<0,0.000000,0>}
cylinder{<97.790000,-0.1,10.160000><97.790000,0.135000,10.160000>0.609600 translate<0,0.000000,0>}}
difference{
cylinder{<97.790000,0,10.160000><97.790000,0.036000,10.160000>0.330200 translate<0,0.000000,0>}
cylinder{<97.790000,-0.1,10.160000><97.790000,0.135000,10.160000>0.177800 translate<0,0.000000,0>}}
//S4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.939800,0.000000,20.650200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.304800,0.000000,20.015200>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<0.304800,0.000000,20.015200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.939800,0.000000,20.650200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.680200,0.000000,20.650200>}
box{<0,0,-0.076200><5.740400,0.036000,0.076200> rotate<0,0.000000,0> translate<0.939800,0.000000,20.650200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.315200,0.000000,20.015200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.680200,0.000000,20.650200>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<6.680200,0.000000,20.650200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.680200,0.000000,7.289800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.315200,0.000000,7.924800>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<6.680200,0.000000,7.289800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.680200,0.000000,7.289800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.939800,0.000000,7.289800>}
box{<0,0,-0.076200><5.740400,0.036000,0.076200> rotate<0,0.000000,0> translate<0.939800,0.000000,7.289800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.304800,0.000000,7.924800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.939800,0.000000,7.289800>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<0.304800,0.000000,7.924800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.128000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.128000,0.000000,11.684000>}
box{<0,0,-0.076200><4.572000,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.128000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-0.508000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-0.508000,0.000000,11.684000>}
box{<0,0,-0.076200><4.572000,0.036000,0.076200> rotate<0,-90.000000,0> translate<-0.508000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.350000,0.000000,12.065000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<5.715000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.350000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.350000,0.000000,11.430000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.350000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.350000,0.000000,11.430000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<5.715000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,0.000000,10.795000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.905000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,0.000000,10.795000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<1.270000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,0.000000,12.065000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<1.270000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,0.000000,12.065000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<1.270000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.715000,0.000000,12.700000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.905000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.410200,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.350000,0.000000,12.065000>}
box{<0,0,-0.076200><3.311170,0.036000,0.076200> rotate<0,73.506395,0> translate<5.410200,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.315200,0.000000,7.924800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.315200,0.000000,11.099800>}
box{<0,0,-0.076200><3.175000,0.036000,0.076200> rotate<0,90.000000,0> translate<7.315200,0.000000,11.099800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.315200,0.000000,20.015200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.315200,0.000000,16.840200>}
box{<0,0,-0.076200><3.175000,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.315200,0.000000,16.840200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.304800,0.000000,16.840200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.304800,0.000000,20.015200>}
box{<0,0,-0.076200><3.175000,0.036000,0.076200> rotate<0,90.000000,0> translate<0.304800,0.000000,20.015200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.304800,0.000000,7.924800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.304800,0.000000,11.150600>}
box{<0,0,-0.076200><3.225800,0.036000,0.076200> rotate<0,90.000000,0> translate<0.304800,0.000000,11.150600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.209800,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,0.000000,12.065000>}
box{<0,0,-0.076200><3.311170,0.036000,0.076200> rotate<0,-73.506395,0> translate<1.270000,0.000000,12.065000> }
object{ARC(3.592103,0.152400,315.000000,585.000000,0.036000) translate<3.810000,0.000000,13.970000>}
object{ARC(2.839806,0.152400,333.434949,566.565051,0.036000) translate<3.810000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.209800,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.410200,0.000000,15.240000>}
box{<0,0,-0.076200><3.200400,0.036000,0.076200> rotate<0,0.000000,0> translate<2.209800,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-0.508000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.304800,0.000000,11.150600>}
box{<0,0,-0.076200><0.972193,0.036000,0.076200> rotate<0,33.272692,0> translate<-0.508000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.304800,0.000000,11.150600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,8.890000>}
box{<0,0,-0.076200><4.170940,0.036000,0.076200> rotate<0,32.816918,0> translate<0.304800,0.000000,11.150600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.128000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.315200,0.000000,11.099800>}
box{<0,0,-0.076200><1.000966,0.036000,0.076200> rotate<0,-35.704335,0> translate<7.315200,0.000000,11.099800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.315200,0.000000,11.099800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,8.890000>}
box{<0,0,-0.076200><4.143627,0.036000,0.076200> rotate<0,-32.226630,0> translate<3.810000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.128000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.315200,0.000000,16.840200>}
box{<0,0,-0.076200><1.000966,0.036000,0.076200> rotate<0,35.704335,0> translate<7.315200,0.000000,16.840200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.315200,0.000000,16.840200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,19.050000>}
box{<0,0,-0.076200><4.143627,0.036000,0.076200> rotate<0,32.226630,0> translate<3.810000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-0.508000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.304800,0.000000,16.840200>}
box{<0,0,-0.076200><1.000966,0.036000,0.076200> rotate<0,-35.704335,0> translate<-0.508000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.304800,0.000000,16.840200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,19.050000>}
box{<0,0,-0.076200><4.143627,0.036000,0.076200> rotate<0,-32.226630,0> translate<0.304800,0.000000,16.840200> }
//T1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.565000,0.000000,33.909000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<75.755000,0.000000,33.909000>}
box{<0,0,-0.063500><4.190000,0.036000,0.063500> rotate<0,0.000000,0> translate<71.565000,0.000000,33.909000> }
object{ARC(2.666994,0.127000,25.208500,154.791500,0.036000) translate<73.660000,0.000000,35.559991>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.796000,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.524000,0.000000,35.433000>}
box{<0,0,-0.063500><2.272000,0.036000,0.063500> rotate<0,0.000000,0> translate<72.524000,0.000000,35.433000> }
object{ARC(2.667019,0.127000,154.790209,182.727809,0.036000) translate<73.659997,0.000000,35.559928>}
object{ARC(2.667025,0.127000,182.731349,205.210149,0.036000) translate<73.659997,0.000000,35.560091>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.256000,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.996000,0.000000,35.433000>}
box{<0,0,-0.063500><1.260000,0.036000,0.063500> rotate<0,0.000000,0> translate<70.996000,0.000000,35.433000> }
object{ARC(2.667041,0.127000,205.210352,218.248852,0.036000) translate<73.659506,0.000000,35.560106>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.524000,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.256000,0.000000,35.433000>}
box{<0,0,-0.063500><0.268000,0.036000,0.063500> rotate<0,0.000000,0> translate<72.256000,0.000000,35.433000> }
object{ARC(2.667025,0.127000,334.789851,357.268651,0.036000) translate<73.660003,0.000000,35.560091>}
object{ARC(2.667019,0.127000,357.272191,385.209791,0.036000) translate<73.660003,0.000000,35.559928>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.324000,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<75.064000,0.000000,35.433000>}
box{<0,0,-0.063500><1.260000,0.036000,0.063500> rotate<0,0.000000,0> translate<75.064000,0.000000,35.433000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<75.064000,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.796000,0.000000,35.433000>}
box{<0,0,-0.063500><0.268000,0.036000,0.063500> rotate<0,0.000000,0> translate<74.796000,0.000000,35.433000> }
object{ARC(2.667044,0.127000,321.751123,335.360523,0.036000) translate<73.660494,0.000000,35.560109>}
//T2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.785000,0.000000,33.909000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.975000,0.000000,33.909000>}
box{<0,0,-0.063500><4.190000,0.036000,0.063500> rotate<0,0.000000,0> translate<53.785000,0.000000,33.909000> }
object{ARC(2.666994,0.127000,25.208500,154.791500,0.036000) translate<55.880000,0.000000,35.559991>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.016000,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.744000,0.000000,35.433000>}
box{<0,0,-0.063500><2.272000,0.036000,0.063500> rotate<0,0.000000,0> translate<54.744000,0.000000,35.433000> }
object{ARC(2.667019,0.127000,154.790209,182.727809,0.036000) translate<55.879997,0.000000,35.559928>}
object{ARC(2.667025,0.127000,182.731349,205.210149,0.036000) translate<55.879997,0.000000,35.560091>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.476000,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.216000,0.000000,35.433000>}
box{<0,0,-0.063500><1.260000,0.036000,0.063500> rotate<0,0.000000,0> translate<53.216000,0.000000,35.433000> }
object{ARC(2.667041,0.127000,205.210352,218.248852,0.036000) translate<55.879506,0.000000,35.560106>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.744000,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.476000,0.000000,35.433000>}
box{<0,0,-0.063500><0.268000,0.036000,0.063500> rotate<0,0.000000,0> translate<54.476000,0.000000,35.433000> }
object{ARC(2.667025,0.127000,334.789851,357.268651,0.036000) translate<55.880003,0.000000,35.560091>}
object{ARC(2.667019,0.127000,357.272191,385.209791,0.036000) translate<55.880003,0.000000,35.559928>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.544000,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.284000,0.000000,35.433000>}
box{<0,0,-0.063500><1.260000,0.036000,0.063500> rotate<0,0.000000,0> translate<57.284000,0.000000,35.433000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.284000,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.016000,0.000000,35.433000>}
box{<0,0,-0.063500><0.268000,0.036000,0.063500> rotate<0,0.000000,0> translate<57.016000,0.000000,35.433000> }
object{ARC(2.667044,0.127000,321.751123,335.360523,0.036000) translate<55.880494,0.000000,35.560109>}
//T3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.945000,0.000000,33.909000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.135000,0.000000,33.909000>}
box{<0,0,-0.063500><4.190000,0.036000,0.063500> rotate<0,0.000000,0> translate<63.945000,0.000000,33.909000> }
object{ARC(2.666994,0.127000,25.208500,154.791500,0.036000) translate<66.040000,0.000000,35.559991>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.176000,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.904000,0.000000,35.433000>}
box{<0,0,-0.063500><2.272000,0.036000,0.063500> rotate<0,0.000000,0> translate<64.904000,0.000000,35.433000> }
object{ARC(2.667019,0.127000,154.790209,182.727809,0.036000) translate<66.039997,0.000000,35.559928>}
object{ARC(2.667025,0.127000,182.731349,205.210149,0.036000) translate<66.039997,0.000000,35.560091>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.636000,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.376000,0.000000,35.433000>}
box{<0,0,-0.063500><1.260000,0.036000,0.063500> rotate<0,0.000000,0> translate<63.376000,0.000000,35.433000> }
object{ARC(2.667041,0.127000,205.210352,218.248852,0.036000) translate<66.039506,0.000000,35.560106>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.904000,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.636000,0.000000,35.433000>}
box{<0,0,-0.063500><0.268000,0.036000,0.063500> rotate<0,0.000000,0> translate<64.636000,0.000000,35.433000> }
object{ARC(2.667025,0.127000,334.789851,357.268651,0.036000) translate<66.040003,0.000000,35.560091>}
object{ARC(2.667019,0.127000,357.272191,385.209791,0.036000) translate<66.040003,0.000000,35.559928>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.704000,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.444000,0.000000,35.433000>}
box{<0,0,-0.063500><1.260000,0.036000,0.063500> rotate<0,0.000000,0> translate<67.444000,0.000000,35.433000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.444000,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.176000,0.000000,35.433000>}
box{<0,0,-0.063500><0.268000,0.036000,0.063500> rotate<0,0.000000,0> translate<67.176000,0.000000,35.433000> }
object{ARC(2.667044,0.127000,321.751123,335.360523,0.036000) translate<66.040494,0.000000,35.560109>}
//U$1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.460000,-1.536000,50.220000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.460000,-1.536000,39.420000>}
box{<0,0,-0.101600><10.800000,0.036000,0.101600> rotate<0,-90.000000,0> translate<18.460000,-1.536000,39.420000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.460000,-1.536000,39.420000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.260000,-1.536000,39.420000>}
box{<0,0,-0.101600><8.800000,0.036000,0.101600> rotate<0,0.000000,0> translate<18.460000,-1.536000,39.420000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.260000,-1.536000,39.420000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.260000,-1.536000,50.220000>}
box{<0,0,-0.101600><10.800000,0.036000,0.101600> rotate<0,90.000000,0> translate<27.260000,-1.536000,50.220000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.460000,-1.536000,50.220000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.260000,-1.536000,50.220000>}
box{<0,0,-0.101600><8.800000,0.036000,0.101600> rotate<0,0.000000,0> translate<18.460000,-1.536000,50.220000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.260000,-1.536000,48.310000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.260000,-1.536000,50.220000>}
box{<0,0,-0.101600><1.910000,0.036000,0.101600> rotate<0,90.000000,0> translate<27.260000,-1.536000,50.220000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.260000,-1.536000,39.420000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.260000,-1.536000,43.235000>}
box{<0,0,-0.101600><3.815000,0.036000,0.101600> rotate<0,90.000000,0> translate<27.260000,-1.536000,43.235000> }
object{ARC(3.077513,0.203200,286.280968,577.632207,0.036000) translate<22.872225,-1.536000,45.724100>}
difference{
cylinder{<22.860000,0,45.720000><22.860000,0.036000,45.720000>3.176700 translate<0,-1.536000,0>}
cylinder{<22.860000,-0.1,45.720000><22.860000,0.135000,45.720000>2.973500 translate<0,-1.536000,0>}}
difference{
cylinder{<22.860000,0,45.720000><22.860000,0.036000,45.720000>1.000300 translate<0,-1.536000,0>}
cylinder{<22.860000,-0.1,45.720000><22.860000,0.135000,45.720000>1.000300 translate<0,-1.536000,0>}}
//U1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.652000,0.000000,42.418000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<89.662000,0.000000,42.418000>}
box{<0,0,-0.063500><80.010000,0.036000,0.063500> rotate<0,0.000000,0> translate<9.652000,0.000000,42.418000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.652000,0.000000,42.418000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.652000,0.000000,6.350000>}
box{<0,0,-0.063500><36.068000,0.036000,0.063500> rotate<0,-90.000000,0> translate<9.652000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.652000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<89.662000,0.000000,6.350000>}
box{<0,0,-0.063500><80.010000,0.036000,0.063500> rotate<0,0.000000,0> translate<9.652000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<89.662000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<89.662000,0.000000,42.418000>}
box{<0,0,-0.063500><36.068000,0.036000,0.063500> rotate<0,90.000000,0> translate<89.662000,0.000000,42.418000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.272000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.272000,0.000000,15.240000>}
box{<0,0,-0.063500><16.510000,0.036000,0.063500> rotate<0,-90.000000,0> translate<17.272000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.272000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<82.042000,0.000000,31.750000>}
box{<0,0,-0.063500><64.770000,0.036000,0.063500> rotate<0,0.000000,0> translate<17.272000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<82.042000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<82.042000,0.000000,15.240000>}
box{<0,0,-0.063500><16.510000,0.036000,0.063500> rotate<0,-90.000000,0> translate<82.042000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.272000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<82.042000,0.000000,15.240000>}
box{<0,0,-0.063500><64.770000,0.036000,0.063500> rotate<0,0.000000,0> translate<17.272000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.082000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.082000,0.000000,17.780000>}
box{<0,0,-0.063500><11.430000,0.036000,0.063500> rotate<0,-90.000000,0> translate<21.082000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.082000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.962000,0.000000,17.780000>}
box{<0,0,-0.063500><55.880000,0.036000,0.063500> rotate<0,0.000000,0> translate<21.082000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.962000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.962000,0.000000,29.210000>}
box{<0,0,-0.063500><11.430000,0.036000,0.063500> rotate<0,90.000000,0> translate<76.962000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.962000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.082000,0.000000,29.210000>}
box{<0,0,-0.063500><55.880000,0.036000,0.063500> rotate<0,0.000000,0> translate<21.082000,0.000000,29.210000> }
//X1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<51.130200,-1.536000,40.538400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.169800,-1.536000,40.538400>}
box{<0,0,-0.127000><12.039600,0.036000,0.127000> rotate<0,0.000000,0> translate<51.130200,-1.536000,40.538400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<50.114200,-1.536000,48.361600>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.185800,-1.536000,48.361600>}
box{<0,0,-0.127000><14.071600,0.036000,0.127000> rotate<0,0.000000,0> translate<50.114200,-1.536000,48.361600> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.058800,-1.536000,41.148000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.100200,-1.536000,47.040800>}
box{<0,0,-0.127000><5.984113,0.036000,0.127000> rotate<0,-79.972654,0> translate<64.058800,-1.536000,41.148000> }
object{ARC(0.994831,0.254000,340.853339,448.536968,0.036000) translate<64.160400,-1.536000,47.367094>}
object{ARC(0.952500,0.254000,269.978173,338.899806,0.036000) translate<63.170163,-1.536000,41.490900>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<50.241200,-1.536000,41.148000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.199800,-1.536000,47.040800>}
box{<0,0,-0.127000><5.984113,0.036000,0.127000> rotate<0,79.972654,0> translate<49.199800,-1.536000,47.040800> }
object{ARC(0.994831,0.254000,91.463032,199.146661,0.036000) translate<50.139600,-1.536000,47.367094>}
object{ARC(0.952500,0.254000,201.100194,270.021827,0.036000) translate<51.129838,-1.536000,41.490900>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.859200,-1.536000,49.072800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.859200,-1.536000,39.827200>}
box{<0,0,-0.127000><9.245600,0.036000,0.127000> rotate<0,-90.000000,0> translate<41.859200,-1.536000,39.827200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.367200,-1.536000,39.319200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<71.958200,-1.536000,39.319200>}
box{<0,0,-0.127000><29.591000,0.036000,0.127000> rotate<0,0.000000,0> translate<42.367200,-1.536000,39.319200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<72.440800,-1.536000,39.801800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<72.440800,-1.536000,49.072800>}
box{<0,0,-0.127000><9.271000,0.036000,0.127000> rotate<0,90.000000,0> translate<72.440800,-1.536000,49.072800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<71.932800,-1.536000,49.580800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.367200,-1.536000,49.580800>}
box{<0,0,-0.127000><29.565600,0.036000,0.127000> rotate<0,0.000000,0> translate<42.367200,-1.536000,49.580800> }
object{ARC(0.508000,0.254000,90.000000,180.000000,0.036000) translate<42.367200,-1.536000,49.072800>}
object{ARC(0.508000,0.254000,0.000000,90.000000,0.036000) translate<71.932800,-1.536000,49.072800>}
object{ARC(0.508000,0.254000,270.000000,360.000000,0.036000) translate<71.932800,-1.536000,39.827200>}
object{ARC(0.508000,0.254000,180.000000,270.000000,0.036000) translate<42.367200,-1.536000,39.827200>}
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  MAIN(-55.880100,0,-25.395000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//C3	100u	E2,5-7
//R1		CA9V
//S4		320-916
//U$1	KLDVX-0202-A	KLDVX-0202-A
//X1	D-SUB9-H2M09ST	H2M09ST
