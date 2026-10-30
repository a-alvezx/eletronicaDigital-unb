<div align="center">
  <img src="../assets/logoUnb.svg" width="150" alt="Logo Universidade de Brasília">
</div>
<br>

# Sistema de Monitoramento de Risco Industrial Baseado em RA

Projeto de um circuito lógico combinacional desenvolvido para um sistema de monitoramento de risco industrial. O sistema avalia quatro sensores digitais (A, B, C e D), onde cada sensor possui um peso específico calculado a partir dos oito últimos dígitos do número de matrícula (RA) do aluno.

Com base na soma dos pesos dos sensores ativados, o circuito classifica a condição global do sistema em três estados mutuamente exclusivos:
*   **NORMAL:** Aciona um LED verde.
*   **ALERTA:** Aciona um LED amarelo.
*   **CRÍTICO:** Aciona um LED vermelho.

O hardware foi modelado através do levantamento da tabela verdade e da simplificação das funções lógicas via Mapas de Karnaugh. A implementação final em VHDL atende à restrição arquitetural de utilizar apenas portas lógicas a partir das expressões booleanas simplificadas, sem o uso de operadores aritméticos para o cálculo do risco. O circuito foi sintetizado no Vivado e validado fisicamente na placa FPGA Xilinx Basys 3.

## Estrutura de Arquivos

```text
proj1_monitoramento_risco/
├── src/
│   └── monitoramento_risco.vhd     # Código VHDL principal com as expressões booleanas
├── tb/
│   └── monitoramento_risco_tb.vhd  # Testbench validando as 16 combinações e a exclusividade das saídas
├── constraints/
│   └── basys3.xdc                  # Mapeamento físico para 4 chaves (entradas) e 3 LEDs (saídas)
├── bitstream/
│   └── monitoramento_risco.bit     # Arquivo de configuração final gerado após a síntese
└── docs/
    └── memorando_calculos.pdf      # Registro do RA, cálculo dos pesos, Tabela Verdade e Mapas de Karnaugh
```

## Como Executar

1. Crie um novo projeto RTL no Xilinx Vivado e selecione a placa **Basys 3**.
2. Adicione os arquivos da pasta `src/` como *Design Sources* (desmarque a opção "Copy sources into project").
3. Adicione o arquivo da pasta `tb/` como *Simulation Sources*.
4. Importe o arquivo `.xdc` da pasta `constraints/`.
5. Execute a simulação comportamental (Run Simulation) para validar o testbench.
6. Gere o Bitstream (Generate Bitstream) e utilize o *Hardware Manager* para gravar na FPGA.

## Autor

**André Alves Mendes**
- **Matrícula (RA):** 252003794
- Engenharia de Software - Universidade de Brasília (UnB - FGA)
- GitHub: [@a-alvezx](https://github.com/a-alvezx)
