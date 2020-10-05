# Calculadora de Datas
![](https://img.shields.io/badge/status-working-orange)
[![](https://img.shields.io/badge/buy%20me%20a%20coffee-donate-yellow.svg?logo=data:image/svg%2bxml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pjxzdmcgcm9sZT0iaW1nIiB2aWV3Qm94PSIwIDAgMjQgMjQiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHRpdGxlLz48cGF0aCBkPSJNNi44OTggMEw1LjY4MiAyLjc5OUgzLjg3N3YyLjUyM2guNjk1TDUuMjc3IDkuOEg0LjE3MmwxLjQ2IDguMjMuOTM4LS4wMUw3LjUxMiAyNGg4LjkxOGwuMDYyLS40Ljg4LTUuNTguODg4LjAxIDEuNDYtOC4yMzFoLTEuMDU2bC43MDUtNC40NzdoLjc1NlYyLjhoLTEuOTE4TDE2Ljk5IDBINi44OTh6bS41MjguODA1aDkuMDQzbC43NzEgMS43OEg2LjY1MmwuNzc0LTEuNzh6bS0yLjc1IDIuNzk3SDE5LjMydi45Mkg0LjY3NnYtLjkyem0uNDUzIDYuOTk4aDEzLjYzNWwtMS4xNzYgNi42Mi01LjY0OS0uMDYtNS42MzYuMDYtMS4xNzQtNi42MnoiLz48L3N2Zz4=)](https://www.buymeacoffee.com/caiosilva)
[![](https://img.shields.io/badge/playstore-download-blue.svg?logo=data:image/svg%2bxml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/PjxzdmcgaWQ9IuugiOydtOyWtF8xIiBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCAyNiAyNjsiIHZlcnNpb249IjEuMSIgdmlld0JveD0iMCAwIDI2IDI2IiB4bWw6c3BhY2U9InByZXNlcnZlIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIj48c3R5bGUgdHlwZT0idGV4dC9jc3MiPgoJLnN0MHtmaWxsOnVybCgjWE1MSURfOThfKTt9Cgkuc3Qxe2ZpbGw6dXJsKCNYTUxJRF85OV8pO30KCS5zdDJ7ZmlsbDp1cmwoI1hNTElEXzEwMF8pO30KCS5zdDN7ZmlsbDp1cmwoI1hNTElEXzEwMV8pO30KPC9zdHlsZT48ZyBpZD0iWE1MSURfMl8iPjxsaW5lYXJHcmFkaWVudCBncmFkaWVudFRyYW5zZm9ybT0ibWF0cml4KDEgMCAwIC0xIDAgNTUxLjU5NzEpIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgaWQ9IlhNTElEXzk4XyIgeDE9IjEzLjY0MTEiIHgyPSItMy4xNDEzIiB5MT0iNTQ5Ljg4ODYiIHkyPSI1MzMuMTA2MiI+PHN0b3Agb2Zmc2V0PSIwIiBzdHlsZT0ic3RvcC1jb2xvcjojMDBBMEZGIi8+PHN0b3Agb2Zmc2V0PSI2LjU3NDQ1MGUtMDMiIHN0eWxlPSJzdG9wLWNvbG9yOiMwMEExRkYiLz48c3RvcCBvZmZzZXQ9IjAuMjYwMSIgc3R5bGU9InN0b3AtY29sb3I6IzAwQkVGRiIvPjxzdG9wIG9mZnNldD0iMC41MTIyIiBzdHlsZT0ic3RvcC1jb2xvcjojMDBEMkZGIi8+PHN0b3Agb2Zmc2V0PSIwLjc2MDQiIHN0eWxlPSJzdG9wLWNvbG9yOiMwMERGRkYiLz48c3RvcCBvZmZzZXQ9IjEiIHN0eWxlPSJzdG9wLWNvbG9yOiMwMEUzRkYiLz48L2xpbmVhckdyYWRpZW50PjxwYXRoIGNsYXNzPSJzdDAiIGQ9Ik0yLjMsMC41QzIsMC44LDEuOCwxLjMsMS44LDEuOXYyMi4xYzAsMC42LDAuMiwxLjEsMC41LDEuNGwwLjEsMC4xbDEyLjQtMTIuNFYxM3YtMC4xTDIuMywwLjUgICBMMi4zLDAuNXoiIGlkPSJYTUxJRF82XyIvPjxsaW5lYXJHcmFkaWVudCBncmFkaWVudFRyYW5zZm9ybT0ibWF0cml4KDEgMCAwIC0xIDAgNTUxLjU5NzEpIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgaWQ9IlhNTElEXzk5XyIgeDE9IjI1LjY3NTgiIHgyPSIxLjQ3ODkiIHkxPSI1MzguNTk2OSIgeTI9IjUzOC41OTY5Ij48c3RvcCBvZmZzZXQ9IjAiIHN0eWxlPSJzdG9wLWNvbG9yOiNGRkUwMDAiLz48c3RvcCBvZmZzZXQ9IjAuNDA4NyIgc3R5bGU9InN0b3AtY29sb3I6I0ZGQkQwMCIvPjxzdG9wIG9mZnNldD0iMC43NzU0IiBzdHlsZT0ic3RvcC1jb2xvcjojRkZBNTAwIi8+PHN0b3Agb2Zmc2V0PSIxIiBzdHlsZT0ic3RvcC1jb2xvcjojRkY5QzAwIi8+PC9saW5lYXJHcmFkaWVudD48cGF0aCBjbGFzcz0ic3QxIiBkPSJNMTguOSwxNy4zbC00LjEtNC4xVjEzdi0wLjFsNC4xLTQuMUwxOSw4LjhsNC45LDIuOGMxLjQsMC44LDEuNCwyLjEsMCwyLjlMMTguOSwxNy4zTDE4LjksMTcuMyAgIHoiIGlkPSJYTUxJRF81XyIvPjxsaW5lYXJHcmFkaWVudCBncmFkaWVudFRyYW5zZm9ybT0ibWF0cml4KDEgMCAwIC0xIDAgNTUxLjU5NzEpIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgaWQ9IlhNTElEXzEwMF8iIHgxPSIxNi42Njg0IiB4Mj0iLTYuMDg5OSIgeTE9IjUzNi4zMDIyIiB5Mj0iNTEzLjU0MzkiPjxzdG9wIG9mZnNldD0iMCIgc3R5bGU9InN0b3AtY29sb3I6I0ZGM0E0NCIvPjxzdG9wIG9mZnNldD0iMSIgc3R5bGU9InN0b3AtY29sb3I6I0MzMTE2MiIvPjwvbGluZWFyR3JhZGllbnQ+PHBhdGggY2xhc3M9InN0MiIgZD0iTTE5LDE3LjJMMTQuNywxM0wyLjMsMjUuNUMyLjcsMjYsMy41LDI2LDQuNCwyNS41TDE5LDE3LjIiIGlkPSJYTUxJRF80XyIvPjxsaW5lYXJHcmFkaWVudCBncmFkaWVudFRyYW5zZm9ybT0ibWF0cml4KDEgMCAwIC0xIDAgNTUxLjU5NzEpIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgaWQ9IlhNTElEXzEwMV8iIHgxPSItMC44NjEzIiB4Mj0iOS4zMDEyIiB5MT0iNTU4LjQyMjEiIHkyPSI1NDguMjU5NiI+PHN0b3Agb2Zmc2V0PSIwIiBzdHlsZT0ic3RvcC1jb2xvcjojMzJBMDcxIi8+PHN0b3Agb2Zmc2V0PSI2Ljg1MDAwMGUtMDIiIHN0eWxlPSJzdG9wLWNvbG9yOiMyREE3NzEiLz48c3RvcCBvZmZzZXQ9IjAuNDc2MiIgc3R5bGU9InN0b3AtY29sb3I6IzE1Q0Y3NCIvPjxzdG9wIG9mZnNldD0iMC44MDA5IiBzdHlsZT0ic3RvcC1jb2xvcjojMDZFNzc1Ii8+PHN0b3Agb2Zmc2V0PSIxIiBzdHlsZT0ic3RvcC1jb2xvcjojMDBGMDc2Ii8+PC9saW5lYXJHcmFkaWVudD48cGF0aCBjbGFzcz0ic3QzIiBkPSJNMTksOC44TDQuNCwwLjVDMy41LDAsMi43LDAsMi4zLDAuNUwxNC43LDEzTDE5LDguOHoiIGlkPSJYTUxJRF8zXyIvPjwvZz48L3N2Zz4=)](https://play.google.com/store)

Um **objeto de cálculo** desenvolvido para os entusiastas de equações que envolvam períodos, intervalos e datas. O aplicativo ***CalcDate*** busca reunir através da abstração de uma máquina calculadora, diversos recursos que possam realizar equações relacionadas a entradas de formato cronológico.

<img src="https://user-images.githubusercontent.com/36136627/71374609-14a88080-259a-11ea-9843-2e55f6d4ea50.png" height="430"> <img src="https://user-images.githubusercontent.com/36136627/71374610-15d9ad80-259a-11ea-86cc-5cd1e9f12a80.png" height="430">
<img src="https://user-images.githubusercontent.com/36136627/71374614-170ada80-259a-11ea-92c0-7ab7c0999c4c.png" height="430">

# Novos recursos
Para implementar novos recursos de cálculo, sugere-se respeitar a estrutura atual do código, de forma que cada nova _feature_ deve ser inserida como uma nova funcionalidade da calculadora, isto é, através de uma nova rota:

  ```dart

```

# Recursos Futuros
No que se refere aos recursos futuros, existem um pequeno planejamento no qual algumas funcionalidades já se encontram em desenvolvimento e devem ser implementadas em nova atualização. Veja:
<br>

 <img align="right" src="https://user-images.githubusercontent.com/36136627/71374805-dc557200-259a-11ea-9f8a-45fbafaba984.png" height="430">
 
- [x] Calcular intervalo
  - [x] Em anos
  - [x] Em meses
  - [x] Em dias
  - [ ] Em horas
  - [ ] Em minutos
  - [ ] Em segundos
- [ ] Calcular baseado em dias da semana
- [ ] Calcular baseado em dias úteis
- [x] Suporte a idiomas
- [ ] Suporte a fuso-horários
- [ ] Histórico
- [ ] Compartilhar resultados

<br> 
<br>

## Autor
<img src= "https://avatars3.githubusercontent.com/u/36136627?s=400&v=4" width="170" height="170">

**Linkedin:** [@caiodepaulasilva](https://www.linkedin.com/in/caiodepaulasilva/) <br>
**Medium:** [@caiodepaulasilva](https://medium.com/@caiodepaulasilva)

### Contribua:

0.  Dê a esse projeto uma  ⭐️
1.  Crie uma _issue_ e descreva suas ideias
2. [Fork it](https://github.com/caiodepaulasilva/calcDate/fork)



## Informações de Licença

[![licensebuttons by-nc-sa](https://licensebuttons.net/l/by-nc-sa/3.0/88x31.png)](https://creativecommons.org/licenses/by-nc-sa/4.0)

O CalcDate sob autoria de Caio Silva está licenciado sob uma Licença Internacional [Creative Commons Attribution-NonCommercial 4.0 International](https://creativecommons.org/licenses/by-nc/4.0/). Para situações extraordinárias e permissões além do escopo desta licença, entrar em contato através de perfil [LinkedIn](https://www.linkedin.com/in/caiodepaulasilva/) do autor.