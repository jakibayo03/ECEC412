library IEEE;
use IEEE.std_logic_1164.all;

entity IFIDReg is

	port (
		clk : in std_logic;
		In_Stall_If : in std_logic;
		In_ID_Req : in std_logic;
		In_ID_BAddr :  std_logic_vector(31 downto 0);
		In_Ctrl_IF : in  std_logic_vector(31 downto 0);
		Init_n : in  std_logic_vector(31 downto 0);
		Rdy_n : in std_logic;
		Bus_Data : inout  std_logic_vector(31 downto 0);
		Bus_Addr : out  std_logic_vector(31 downto 0);
		Bus_Rd_n : out std_logic;
		Bus_Wr_n : out std_logic;
		IF_IP : out  std_logic_vector(31 downto 0);
		IF_Instr : out  std_logic_vector(31 downto 0));

	end IFIDReg;

Architecture Struct of IFIDReg is
	signal nextPC :  std_logic_vector(31 downto 0);
	signal intPC :  std_logic_vector(31 downto 0);
	signal intIncPC :  std_logic_vector(31 downto 0);
	signal Stall : std_logic;
	signal TriStateBus : std_logic;

begin
process (Clk)
	begin
	if rising_edge(Clk) then
		if Stall = '0' then
			intPC <= nextPC;
		end if;

		if Init_n = "0" then	
			intPC <= x"0000_0100";
		end if;
	end if;
end process;

end Struct;
