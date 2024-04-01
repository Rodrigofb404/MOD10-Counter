library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador is
  port (
    clk     : in std_logic;
    reset   : in std_logic;
    seletor : in std_logic;
    contador: out std_logic_vector(3 downto 0)
  );
end entity contador;

architecture rtl of contador is
  signal reg_contador : unsigned(3 downto 0);
begin
  contador <= std_logic_vector(reg_contador);

  process (clk)
  begin
    if rising_edge(clk) then
      if reset = '0' then
        reg_contador <= (others => '0');
      else
        if seletor = '1' then -- Seletor igual a 1, decremento
          if reg_contador = "0000" then
            reg_contador <= "1001";
          else
            reg_contador <= reg_contador - 1;
          end if;
        else -- Seletor igual a 0, incremento
          if reg_contador = "1001" then
            reg_contador <= "0000";
          else
            reg_contador <= reg_contador + 1;
          end if;
        end if;
      end if;
    end if;
  end process;

end architecture rtl;