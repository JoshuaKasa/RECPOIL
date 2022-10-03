// Keybaord
#macro RIGHT keyboard_check(ord("D"))
#macro LEFT keyboard_check(ord("A"))
#macro UP keyboard_check(ord("W"))
#macro DOWN keyboard_check(ord("S"))

#macro SHOOT_AUTOMATIC mouse_check_button(mb_left)
#macro SHOOT mouse_check_button_pressed(mb_left)

#macro CAS keyboard_check_pressed(ord("C"))

#macro GRENADE keyboard_check_pressed(ord("G"))

#macro EQUIP keyboard_check_pressed(ord("E"))
#macro RELOAD_AUTOMATIC keyboard_check_pressed(ord("R"))
#macro RELOAD keyboard_check(ord("R"))
#macro UNJAM keyboard_check_pressed(ord("J"))
#macro UNEQUIP_GUN keyboard_check_pressed(ord("T"))
#macro UNEQUIP_SUIT keyboard_check_pressed(ord("Y"))
#macro REMOVE_GUN keyboard_check_pressed(ord("X"))

// Controller
#macro AXISX gamepad_axis_value(0, gp_axislh)
#macro AXISY gamepad_axis_value(0, gp_axislv)
#macro PAD_X gamepad_axis_value(0, gp_axisrh)
#macro PAD_Y gamepad_axis_value(0, gp_axisrv)

#macro PAD_SHOOT_AUTOMATIC gamepad_button_check(0, gp_shoulderrb)
#macro PAD_SHOOT gamepad_button_check_pressed(0, gp_shoulderrb)

#macro INTERACT gamepad_button_check_pressed(0, gp_face3)
#macro PAD_RELOAD_AUTOMATIC gamepad_button_check_pressed(0, gp_face2)
#macro PAD_UNJAM gamepad_button_check_pressed(0, gp_stickr)
#macro PAD_RELOAD gamepad_button_check(0, gp_face2)
#macro PAD_UNEQUIP gamepad_button_check_pressed(0, gp_shoulderlb)
#macro PAD_UNEQUIP_SUIT gamepad_button_check_pressed(0, gp_face1)

#macro SCROLL_DOWN gamepad_button_check_pressed(0, gp_padd)
#macro SCROLL_UP gamepad_button_check_pressed(0, gp_padu)

// Constants
#macro CAMERA view_camera[0]
#macro CW camera_get_view_width(CAMERA)
#macro CH camera_get_view_height(CAMERA)
#macro GUI_RATIO_X camera_get_view_width(CAMERA) / display_get_gui_width()
#macro GUI_RATIO_Y camera_get_view_height(CAMERA) / display_get_gui_height()

#macro SPEED 0.5

#macro LIMITX room_width
#macro LIMITY room_height

#macro MOUSE_X oCrosshair.x
#macro MOUSE_Y oCrosshair.y

#macro CONTROLLER_X oCursor2.x
#macro CONTROLLER_Y oCursor2.y

#macro CONTROLLER_X_ROOM camera_get_view_x(CAMERA) + CONTROLLER_X * GUI_RATIO_X
#macro CONTROLLER_Y_ROOM camera_get_view_y(CAMERA) + CONTROLLER_Y * GUI_RATIO_Y

#macro TAU pi * 2

#macro GW display_get_gui_width()
#macro GH display_get_gui_height()

#macro WEAPON1 keyboard_check_pressed(ord("1"))
#macro WEAPON2 keyboard_check_pressed(ord("2"))

#macro WEAPON_SWITCH gamepad_button_check_pressed(0, gp_face4)

#macro MAX_DURABILITY 100