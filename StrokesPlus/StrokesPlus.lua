--Enter any Lua script that you'd like always executed when StrokesPlus loads, --or when you click Reload Config and Lua Engine.

function init_key_codes()
	VK_0 = 0x30;
	VK_1 = 0x31;
    VK_2 = 0x32;
	VK_3 = 0x33;
	VK_4 = 0x34;
	VK_5 = 0x35;
	VK_6 = 0x36;
	VK_7 = 0x37;
	VK_8 = 0x38;
	VK_9 = 0x39;
	VK_Minus = 0xBD;
	VK_Equal  = 0xBB;
	VK_A = 0x41;
	VK_B = 0x42;
	VK_C = 0x43;
	VK_D = 0x44;
	VK_E = 0x45;
	VK_F = 0x46;
	VK_G = 0x47;
	VK_H = 0x48;
	VK_I = 0x49;
	VK_J = 0x4A;
	VK_K = 0x4B;
	VK_L = 0x4C;
	VK_M = 0x4D;
	VK_N = 0x4E;
	VK_O = 0x4F;
	VK_P = 0x50;
	VK_Q = 0x51;
	VK_R = 0x52;
	VK_S = 0x53;
	VK_T = 0x54;
	VK_U = 0x55;
	VK_V = 0x56;
	VK_W = 0x57;
	VK_X = 0x58;
	VK_Y = 0x59;
	VK_Z = 0x5A;
	VK_ESCAPE = 0x1B;
	VK_LBUTTON = 0x01;
	VK_RBUTTON = 0x02;
	VK_BACKSPACE = 0x08;
	VK_BROWSER_SEARCH = 0xAA;
	VK_SPACEBAR = 0x20;
	VK_Point = 0xBE;
	VK_Comma = 0xBC;
	VK_DIVIDE = 0x6F;
	VK_Star = 0x6A;
	VK_LShift = 0xA0;
	VK_Tilda = 0xC0;

	VK_PointComma = 0xBA;

	VK_ScobkaLeft = 0xDB; --this is [
	VK_ScobkaRight = 0xDD; --this is ]

	VK_LSHIFT = 0xA0;

	VK_LCONTROL = 0xA2;

	VK_ENTER = 0x0D;

	VK_BACKSPACE = 0x08;
	
	VK_DELETE = 0x2E;
end

function sp_init()	-- code in this function is fired once when the Lua engine is reloaded    -- which occurs when S+ is started, Ok/Apply is clicked in the settings window    -- or when Reload Config and Lua Engine is clicked from the tray menu

	-- But the Russian equivalent, too, do not forget about it
	-- Norman Reedus
	init_macro_standart_functions();
	init_key_codes();
	
	-- ####################AUTO_INPUT_STRING_FUNCTIONAL
	nr_input = function(str)
	--acDisplayText(string.byte(str, i), "Arial", "24", 255, 255, 0,
	--3000, 32, 512)
	--KD(VK_eW)
	--acSendKeys(string.char(103))
		for i = 1, string.len(str) do
			input(str, i);
		end
	end
	
	input = function(str, index)
		local key_code, size = vk_kd_check(str, index);
		if size == "lower" then
			if key_code == "@" then
				acSendKeys("{AT}");
			elseif key_code == "^" then
				acSendKeys("{CARET}");
			else
				KD(vk_kd_check(str, index));
			end
		end
	end
	-- only english please
	vk_kd_check = 
	function(str, index)
		--local lStr = string.lower(str);
		--return get_vk_key(get_char(lStr, index));
		  local Str, size = get_vk_key(get_char(str, index));
		  if size == "upper" then
			acSendKeys("+"..Str);
		  end
		  return Str, size;
	end

	get_char = 
	function(str, index)
		return string.char(string.byte(str, index));
	end

	get_vk_key =
	function(char)
		local key_code = nil;
		local size = "lower";
		
		--upper
		if char == "A" then key_code = VKEY_HDec(VK_A); size = "upper";
		elseif char == "B" then key_code = VKEY_HDec(VK_B); size = "upper";
		elseif char == "C" then key_code = VKEY_HDec(VK_C); size = "upper";
		elseif char == "D" then key_code = VKEY_HDec(VK_D); size = "upper";
		elseif char == "E" then key_code = VKEY_HDec(VK_E); size = "upper";
		elseif char == "F" then key_code = VKEY_HDec(VK_F); size = "upper";
		elseif char == "G" then key_code = VKEY_HDec(VK_G); size = "upper";
		elseif char == "H" then key_code = VKEY_HDec(VK_H); size = "upper";
		elseif char == "I" then key_code = VKEY_HDec(VK_I); size = "upper";
		elseif char == "J" then key_code = VKEY_HDec(VK_J); size = "upper";
		elseif char == "K" then key_code = VKEY_HDec(VK_K); size = "upper";
		elseif char == "L" then key_code = VKEY_HDec(VK_L); size = "upper";
		elseif char == "M" then key_code = VKEY_HDec(VK_M); size = "upper";
		elseif char == "N" then key_code = VKEY_HDec(VK_N); size = "upper";
		elseif char == "O" then key_code = VKEY_HDec(VK_O); size = "upper";
		elseif char == "P" then key_code = VKEY_HDec(VK_P); size = "upper";
		elseif char == "Q" then key_code = VKEY_HDec(VK_Q); size = "upper";
		elseif char == "R" then key_code = VKEY_HDec(VK_R); size = "upper";
		elseif char == "S" then key_code = VKEY_HDec(VK_S); size = "upper";
		elseif char == "T" then key_code = VKEY_HDec(VK_T); size = "upper";
		elseif char == "U" then key_code = VKEY_HDec(VK_U); size = "upper";
		elseif char == "V" then key_code = VKEY_HDec(VK_V); size = "upper";
		elseif char == "W" then key_code = VKEY_HDec(VK_W); size = "upper";
		elseif char == "X" then key_code = VKEY_HDec(VK_X); size = "upper";
		elseif char == "Y" then key_code = VKEY_HDec(VK_Y); size = "upper";
		elseif char == "Z" then key_code = VKEY_HDec(VK_Z); size = "upper";
		--lower
		elseif char == "a" then key_code = VK_A;
		elseif char == "b" then key_code = VK_B;
		elseif char == "c" then key_code = VK_C;
		elseif char == "d" then key_code = VK_D;
		elseif char == "e" then key_code = VK_E;
		elseif char == "f" then key_code = VK_F;
		elseif char == "g" then key_code = VK_G;
		elseif char == "h" then key_code = VK_H;
		elseif char == "i" then key_code = VK_I;
		elseif char == "j" then key_code = VK_J;
		elseif char == "k" then key_code = VK_K;
		elseif char == "l" then key_code = VK_L;
		elseif char == "m" then key_code = VK_M;
		elseif char == "n" then key_code = VK_N;
		elseif char == "o" then key_code = VK_O;
		elseif char == "p" then key_code = VK_P;
		elseif char == "q" then key_code = VK_Q;
		elseif char == "r" then key_code = VK_R;
		elseif char == "s" then key_code = VK_S;
		elseif char == "t" then key_code = VK_T;
		elseif char == "u" then key_code = VK_U;
		elseif char == "v" then key_code = VK_V;
		elseif char == "w" then key_code = VK_W;
		elseif char == "x" then key_code = VK_X;
		elseif char == "y" then key_code = VK_Y;
		elseif char == "z" then key_code = VK_Z;

		elseif char == "0" then key_code = VK_0;
		elseif char == "1" then key_code = VK_1;
		elseif char == "2" then key_code = VK_2;
		elseif char == "3" then key_code = VK_3;
		elseif char == "4" then key_code = VK_4;
		elseif char == "5" then key_code = VK_5;
		elseif char == "6" then key_code = VK_6;
		elseif char == "7" then key_code = VK_7;
		elseif char == "8" then key_code = VK_8;
		elseif char == "9" then key_code = VK_9;
		elseif char == "-" then key_code = VK_Minus;
		elseif char == "=" then key_code = VK_Equal;
		elseif char == "." then key_code = VK_Point;
		elseif char == "," then key_code = VK_Comma;
		elseif char == " " then key_code = VK_SPACEBAR;
		elseif char == "/" then key_code = VK_DIVIDE;
		elseif char == "*" then key_code = VK_Star;
		elseif char == "~" then key_code = VK_Tilda;
		elseif char == ";" then key_code = VK_PointComma; -- this is ;
		elseif char == "[" then key_code = VK_ScobkaLeft; -- this is [
		elseif char == "]" then key_code = VK_ScobkaRight; -- this is ]

		--others
		elseif char == "@" then key_code = "@";
		elseif char == "^" then key_code = "^";
		elseif char == "_" then key_code = VKEY_HDec(VK_Minus); size = "upper"; -- this is _
		elseif char == "$" then key_code = VKEY_HDec(VK_4); size = "upper"; -- this is $
		elseif char == "%" then key_code = VKEY_HDec(VK_5); size = "upper"; -- this is %
		
		elseif char == ")" then key_code = VKEY_HDec(VK_0); size = "upper"; -- this is )
		elseif char == "(" then key_code = VKEY_HDec(VK_9); size = "upper"; -- this is (
		elseif char == "&" then key_code = VKEY_HDec(VK_7); size = "upper"; -- this is &
		elseif char == "#" then key_code = VKEY_HDec(VK_3); size = "upper"; -- this is #
		elseif char == "!" then key_code = VKEY_HDec(VK_1); size = "upper"; -- this is !
		elseif char == ":" then key_code = VKEY_HDec(VK_PointComma); size = "upper"; -- this is :
		elseif char == "{" then key_code = VKEY_HDec(VK_ScobkaLeft); size = "upper"; -- this is {
		elseif char == "}" then key_code = VKEY_HDec(VK_ScobkaRight); size = "upper"; -- this is }
		elseif char == "+" then key_code = VKEY_HDec(VK_Equal); size = "upper"; -- this is }
		
		end
		return key_code, size;
	end

	VKEY_HDec = function(hexNumber)
		return "{VKEY "..tostring(tonumber(hexNumber)).."}";
	end
	-- ####################END
end
function sp_before_action(gnm, gsx, gsy, gex, gey, gwd, gapp, gact, gbl, gbt, gbr, gbb)	-- this code is fired before each action (excluding hotkey actions)end
function sp_after_action(gnm, gsx, gsy, gex, gey, gwd, gapp, gact, gbl, gbt, gbr, gbb)	-- this code is executed after each action (excluding hotkey actions)    -- this function is not enabled by default, you must check the following setting    -- in the Preferences tab: Allow After Action Script*endfunction sp_right_mouse_up()	-- this code is executed whenever you press the right mouse button down	-- this function is not enabled by default, you must check the following setting    -- in the Preferences tab: Allow Right Click Script*endfunction sp_middle_mouse_up()	-- this code is executed whenever you press the middle mouse button down	-- this function is not enabled by default, you must check the following setting    -- in the Preferences tab: Allow Middle Click Script*endfunction sp_left_mouse_up()	-- this code is executed whenever you press the left mouse button down	-- this function is not enabled by default, you must check the following setting    -- in the Preferences tab: Allow Left Click Script*endfunction sp_x1_mouse_up()	-- this code is executed whenever you press the X1 mouse button down	-- this function is not enabled by default, you must check the following setting    -- in the Preferences tab: Allow X1 Click Script*endfunction sp_x2_mouse_up()	-- this code is executed whenever you press the X2 mouse button down	-- this function is not enabled by default, you must check the following setting    -- in the Preferences tab: Allow X2 Click Script*endfunction sp_after_release()	-- this code is executed whenever you release the stroke button	-- this function is not enabled by default, you must check the following setting    -- in the Preferences tab: Allow After Release Script*end
function init_macro_standart_functions()
KD = acSendKeyDown;KVK = acSendKeys;
end
 