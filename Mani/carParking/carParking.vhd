library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity carParking is
port(
A : in std_logic;
B : in std_logic;
reset : in std_logic;
clock : in std_logic;
count : out std_logic_vector(9 downto 0));
end carParking;

architecture Behavioral of carParking is
signal cou : std_logic_vector(9 downto 0);
begin

process(clock)
begin
if(rising_edge(clock)) then
if(reset = '1') then
cou(0) <= '0';
cou(1) <= '0';
cou(2) <= '0';
cou(3) <= '0';
cou(4) <= '0';
cou(5) <= '0';
cou(6) <= '0';
cou(7) <= '0';
cou(8) <= '0';
cou(9) <= '0';
end if;
if(A = '1' and B = '0' and cou < "1111111111" and reset = '0') then
	cou <= cou+1;
end if;
if(A = '0' and B = '1' and cou > "000000000" and reset = '0') then
	cou <= cou-1;
end if;	
end if;
end process;

process(clock)
begin
if(rising_edge(clock)) then
	count<= cou;
end if;
end process;
end Behavioral;

