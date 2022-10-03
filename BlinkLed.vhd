library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--2022-10-02 (October 2nd)
--This code blinks led 5 and turns off all other leds on the DE10-Lite.

--References:
--https://www.fypsolutions.com/fpga/fpga-led-blinking-example/
-- file:///C:/Users/hiphop/Downloads/DE10-Lite_User_Manual%20(1).pdf

entity BlinkLed is
    Port ( 
	 clk : in  STD_LOGIC;
    led : out  STD_LOGIC;
	 unused_leds : out STD_LOGIC_VECTOR(8 downto 0)
	 );
end BlinkLed;

architecture Behavioral of BlinkLed is
	signal clk_counter : natural range 0 to 50000000 := 0; --natural is non-negative numbers. 0,1...
	signal blinker : std_logic := '0';
	signal led_signal : std_logic_vector(8 downto 0) := "000000000";
begin
	
	process(clk)
	begin 
		if rising_edge(clk) then 
			clk_counter <= clk_counter + 1; 
			if clk_counter >= 50000000 then 
			  blinker <= not blinker;
			  clk_counter <= 0;
			end if; 
		end if; 
	end process;
	
	led <= blinker;
end Behavioral;