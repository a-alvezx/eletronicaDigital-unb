<div align="center">
  <img src="./assets/logoUnb.svg" width="150" alt="Logo Universidade de Brasília">
</div>
<br>

# Eletrônica Digital 

Repositório dedicado aos projetos e laboratórios desenvolvidos na disciplina de Teoria e Prática de Eletrônica Digital 1 (TED/PED 1) no curso de Engenharia de Software da Universidade de Brasília (UnB - FGA).

## Tecnologias e Hardware
- **Linguagem:** VHDL
- **Ambientes de Desenvolvimento:** Xilinx Vivado e Intel Quartus Prime
- **Hardware Alvo:** Placa FPGA Xilinx Basys 3 (Artix-7) e Placa FPGA Altera AX (família Cyclone)

## Estrutura dos Projetos
Cada laboratório está organizado em seu próprio diretório contendo:
- `src/`: Códigos fonte em VHDL descrevendo o comportamento ou a estrutura lógica do circuito.
- `tb/`: Testbenches para simulação comportamental das portas e verificação de formas de onda.
- `constraints/`: Arquivos de restrições mapeando as entradas e saídas físicas.
  - Arquivos `.xdc` para a placa Basys 3.
  - Arquivos `.qsf` ou pin planner para a placa Altera AX.

## Laboratórios Desenvolvidos
- **[Lab 01: Somador Binário de 4 Bits](./lab01_somador_4bits)** - Implementação combinacional de um somador completo (Full Adder).

## Como Executar

**Via Xilinx Vivado (Basys 3):**
1. Crie um novo projeto RTL no Vivado e selecione a placa **Basys 3**.
2. Adicione os arquivos da pasta `src/` como *Design Sources* e `tb/` como *Simulation Sources*.
3. Importe o arquivo `.xdc` da pasta `constraints/`.
4. Execute a simulação (Run Simulation) ou gere o Bitstream para gravar na FPGA.

**Via Intel Quartus Prime (Altera AX):**
1. Crie um novo projeto definindo o chip FPGA correspondente à sua placa Altera.
2. Adicione os arquivos das pastas `src/` e `tb/`.
3. Configure o mapeamento de pinos usando o arquivo da pasta `constraints/`.
4. Compile o design e utilize o *Programmer* para gravar na placa.

## Autor
**André Alves Mendes**
- GitHub: [@seu-usuario](https://github.com/seu-usuario)
- LinkedIn: [Seu Nome](https://linkedin.com/in/seu-perfil)
