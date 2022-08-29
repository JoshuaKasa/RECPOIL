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

#macro SPEED 0.5

#macro LIMITX room_width
#macro LIMITY room_height

#macro MOUSE_X oCrosshair.x
#macro MOUSE_Y oCrosshair.y

#macro TAU pi * 2

#macro GW display_get_gui_width()
#macro GH display_get_gui_height()

#macro WEAPON1 keyboard_check_pressed(ord("1"))
#macro WEAPON2 keyboard_check_pressed(ord("2"))

#macro MAX_DURABILITY 100