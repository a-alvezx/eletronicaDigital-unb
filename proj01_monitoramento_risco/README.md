<div align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Marca_UnB.svg/1200px-Marca_UnB.svg.png" width="150" alt="Logo Universidade de Brasília">
</div>
<br>

Sistema de Monitoramento de Risco Industrial Baseado em RA

Projeto de um circuito lógico combinacional desenvolvido para um sistema de monitoramento de risco industrial, desenvolvido como parte da disciplina de Teoria e Prática de Eletrônica Digital 1 (TED/PED 1) da UnB - FGA.

Descrição do Projeto

O sistema avalia quatro sensores digitais (A, B, C e D), onde cada sensor possui um peso específico calculado a partir dos oito últimos dígitos do número de matrícula (RA) do aluno. Com base na soma dos pesos dos sensores ativados, o circuito classifica a condição global do sistema em três estados mutuamente exclusivos:

NORMAL: Aciona um LED verde (condição segura).

ALERTA: Aciona um LED amarelo (condição de atenção).

CRÍTICO: Aciona um LED vermelho (condição de risco detectada).

O projeto segue restrições arquiteturais estritas: a implementação em VHDL utiliza apenas portas lógicas baseadas nas expressões booleanas simplificadas, sem o uso de operadores aritméticos de alto nível para o cálculo de risco no código final.

Tecnologias e Hardware

Linguagem: VHDL

Ambiente de Desenvolvimento: Xilinx Vivado

Hardware Alvo: Placa FPGA Xilinx Basys 3 (Artix-7)

Modelagem Lógica: Tabela Verdade e Mapas de Karnaugh

Estrutura de Diretórios

proj1_monitoramento_risco/
├── src/            # Código VHDL principal com as expressões booleanas (.vhd)
├── tb/             # Testbench validando as 16 combinações e a exclusividade das saídas (.vhd)
├── constraints/    # Mapeamento físico para 4 chaves (entradas) e 3 LEDs (saídas) (.xdc)
├── bitstream/      # Arquivo de configuração final gerado após a síntese (.bit)
└── docs/           # Roteiro do projeto, registro de RA, cálculo dos pesos, Tabela Verdade e Mapas de Karnaugh


Como Executar no Vivado

Crie um novo projeto RTL no Vivado e selecione a placa Basys 3 (part xc7a35tcpg236-1).

Vá em Add Sources. Importante: Desmarque a opção "Copy sources into project".

Adicione os arquivos da pasta src/ como Design Sources.

Adicione os arquivos da pasta tb/ como Simulation Sources.

## Autor

**André Alves Mendes**
- **Matrícula (RA):** 252003794
- Engenharia de Software - Universidade de Brasília (UnB - FGA)

Importe o arquivo .xdc da pasta constraints/.

Rode a simulação comportamental (Run Simulation) para verificar a exclusividade das saídas.

Execute a síntese e gere o Bitstream (Generate Bitstream) para programar a FPGA.
