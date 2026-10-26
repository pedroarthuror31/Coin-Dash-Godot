# Coin-Dash-Godot

# Coin Dash — Jogo 2D desenvolvido em Godot

## Sobre o projeto

O **Coin Dash** é um jogo 2D desenvolvido utilizando a **Godot Engine 4.7.1** e a linguagem de programação **GDScript**.

O projeto foi realizado como atividade acadêmica, tendo como referência o Capítulo 2, *Coin Dash – Build Your First 2D Game*, do livro *Godot 4 Game Development Projects – Second Edition*.

O objetivo do jogo é controlar uma raposa em um cenário bidimensional, coletando moedas, evitando obstáculos e acumulando a maior pontuação possível antes que o tempo disponível termine.

Durante o desenvolvimento, foram implementadas mecânicas de movimentação, detecção de colisões, animações, efeitos sonoros, geração aleatória de objetos, sistema de pontuação, gerenciamento de tempo e progressão de níveis.

Além das funcionalidades básicas, foram realizados ajustes para melhorar a experiência do jogador, como o posicionamento dos objetos no cenário e a prevenção de sobreposições entre moedas e obstáculos.

## Como funciona o jogo

O jogador controla uma raposa que precisa coletar as moedas distribuídas pelo cenário enquanto evita obstáculos.

A partida começa com 30 segundos disponíveis. Cada moeda coletada acrescenta um ponto à pontuação.

Ao coletar todas as moedas de um nível, o jogador avança automaticamente para o próximo, recebe cinco segundos adicionais e enfrenta novos desafios.

Durante a partida, também podem aparecer Powerups, representados por itens verdes, que concedem cinco segundos extras quando coletados.

Os principais elementos do jogo são:

- **Jogador:** personagem controlável, com animações de movimentação, repouso e dano.
- **Moedas:** objetos coletáveis que aumentam a pontuação.
- **Powerups:** itens especiais que aumentam o tempo disponível.
- **Obstáculos:** cactos que devem ser evitados, pois o contato com eles encerra a partida.
- **Cronômetro:** controla o tempo restante da partida.
- **Níveis:** sistema de progressão que aumenta os desafios conforme o jogador coleta as moedas.

A partida termina quando o tempo chega a zero ou quando o jogador colide com um obstáculo.

Após o Game Over, é possível iniciar uma nova partida.

## Tecnologias utilizadas

- **Godot Engine 4.7.1:** motor gráfico utilizado no desenvolvimento do jogo.
- **GDScript:** linguagem de programação responsável pela implementação das mecânicas e funcionalidades.
- **Git e GitHub:** ferramentas utilizadas para versionamento, armazenamento e compartilhamento do projeto.

## Funcionalidades implementadas

### 1. Movimentação do jogador

O personagem pode se movimentar pelo cenário bidimensional, respeitando os limites da área jogável.

Foram implementadas animações para representar diferentes estados do personagem, incluindo movimentação, repouso e dano.

### 2. Sistema de moedas

As moedas são geradas automaticamente em posições aleatórias do cenário.

Quando o jogador entra em contato com uma moeda, ela é coletada, a pontuação aumenta e um efeito sonoro é reproduzido.

Também foram implementados efeitos visuais de coleta e animações de brilho executadas em intervalos aleatórios.

### 3. Sistema de Powerups

Os Powerups aparecem ocasionalmente durante a partida e permanecem disponíveis por um período limitado.

Quando coletados, concedem cinco segundos adicionais ao cronômetro.

O sistema também apresenta animações e efeitos sonoros específicos para esses itens.

### 4. Sistema de obstáculos

Foram implementados obstáculos representados por cactos.

Os obstáculos possuem áreas de colisão que permitem detectar o contato com o jogador, encerrando a partida.

Também foram realizados ajustes na geração dos objetos para reduzir situações em que moedas aparecem sobre cactos ou obstáculos surgem muito próximos do personagem.

### 5. Sistema de pontuação

A pontuação é atualizada automaticamente sempre que uma moeda é coletada.

O valor é exibido na interface durante toda a partida.

### 6. Sistema de tempo

O jogo utiliza um cronômetro regressivo para limitar a duração da partida.

O tempo é atualizado continuamente e pode ser aumentado por meio da conclusão de níveis ou da coleta de Powerups.

Quando o cronômetro chega a zero, a partida termina.

### 7. Progressão de níveis

Ao coletar todas as moedas disponíveis, o jogador avança automaticamente para o próximo nível.

Conforme a progressão, novas moedas e obstáculos são gerados, aumentando gradualmente a dificuldade.

### 8. Interface gráfica

Foi desenvolvida uma interface HUD (*Heads-Up Display*) responsável por apresentar as principais informações da partida.

A interface inclui:

- Pontuação atual.
- Tempo restante.
- Título do jogo.
- Botão para iniciar ou reiniciar.
- Mensagem de Game Over.

### 9. Efeitos visuais e sonoros

O projeto utiliza animações e efeitos sonoros para fornecer feedback ao jogador durante diferentes eventos.

Esses efeitos são executados durante a coleta de moedas, obtenção de Powerups, progressão de níveis e encerramento da partida.

## Estrutura do projeto

O projeto utiliza a organização de cenas e nós da Godot, permitindo separar as responsabilidades dos diferentes elementos do jogo.

```text
Coin Dash/
├── assets/
│   ├── audio/
│   ├── coin/
│   ├── player/
│   ├── pow/
│   ├── cactus.png
│   └── grass.png
├── coin.gd
├── coin.tscn
├── hud.gd
├── hud.tscn
├── main.gd
├── main.tscn
├── obstacle.tscn
├── player.gd
├── player.tscn
├── powerup.gd
├── powerup.tscn
└── project.godot
```

### Principais arquivos

- **main.gd:** controla a lógica geral do jogo, incluindo níveis, pontuação, tempo e geração de objetos.
- **player.gd:** implementa a movimentação do personagem e a detecção de colisões.
- **coin.gd:** controla o comportamento das moedas, suas animações e a coleta.
- **powerup.gd:** implementa o comportamento dos Powerups.
- **hud.gd:** gerencia as informações exibidas na interface.
- **obstacle.tscn:** define a estrutura visual e a área de colisão dos obstáculos.
- **project.godot:** contém as configurações gerais do projeto.

## Como executar

Para executar o projeto localmente:

1. Instale a Godot Engine 4.7.1 ou uma versão compatível.
2. Faça o download do repositório utilizando a opção **Code > Download ZIP** ou clone o projeto com Git.
3. Caso tenha baixado o arquivo ZIP, extraia seu conteúdo.
4. Abra o Gerenciador de Projetos da Godot.
5. Selecione a opção **Importar**.
6. Localize e selecione o arquivo `project.godot`.
7. Abra o projeto no editor.
8. Pressione **F5** para executar o jogo.

## Conceitos aplicados

O desenvolvimento do Coin Dash proporcionou a aplicação prática de conceitos de programação e desenvolvimento de jogos, incluindo:

- Programação orientada a eventos.
- Organização e modularização do código.
- Criação e gerenciamento de cenas e nós.
- Utilização de sinais para comunicação entre objetos.
- Instanciação dinâmica de objetos.
- Manipulação de vetores e coordenadas bidimensionais.
- Detecção de colisões.
- Utilização de grupos para identificação de objetos.
- Temporizadores e controle de eventos.
- Geração de posições aleatórias.
- Animações e efeitos visuais.
- Reprodução de áudio.
- Desenvolvimento de interfaces gráficas.
- Testes, identificação de erros e depuração.

## Desenvolvimento e aprendizado

O projeto permitiu compreender melhor o funcionamento da Godot Engine e a integração entre seus diferentes componentes.

Durante a implementação, foram enfrentados e solucionados problemas relacionados à lógica de programação, indentação, referências a nós, comunicação por sinais, temporizadores e posicionamento dos objetos.

Essas experiências contribuíram para o desenvolvimento de habilidades de resolução de problemas, organização de código e depuração de aplicações.

## Referência

Projeto desenvolvido com base no Capítulo 2 — *Coin Dash – Build Your First 2D Game*, do livro **Godot 4 Game Development Projects – Second Edition**.

O desenvolvimento foi realizado para fins acadêmicos e educacionais, com adaptações e melhorias implementadas durante o processo de aprendizagem.

## Objetivo acadêmico

Este projeto tem como finalidade aplicar conhecimentos de programação no desenvolvimento de um jogo digital funcional, explorando os recursos da Godot Engine e os fundamentos do desenvolvimento de jogos 2D.
