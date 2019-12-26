package Bootloader is

	procedure Erase;
	procedure Start;
      pragma Machine_Attribute (Start, "naked");

end Bootloader;
