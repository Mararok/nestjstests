# <Project>

## Przygotowanie środowiska

### Oprogramowanie

- IDE: Visual Studio Code
- make
- Docker

#### Dodatkowo w Windows

- cygwin
- putty(ustawić GIT_SSH na plink.exe)

### Instalacja/aktualizacja zależności

```bash
make bootstrap
```

### YARN

<https://doppelmutzi.github.io/monorepo-lerna-yarn-workspaces/>

Listowanie workspesów

```bash
yarn workspaces info
```

Wywołanie komendy w wybranym pakiecie

```bash
yarn workspace <nazwa pakietu> run <komenda>
```

### Testowanie

@TODO uzupełnić
