# SHELL-SCRIPT

(adicionar um novo usuário no sistema): O script deve se chamar novo_usuario.sh. Existem 3
(três) tipos de usuários que acessam os sistemas da instituição: professor, técnico e aluno. Cada tipo de
usuário possui um grupo correspondente: professores, tecnicos e alunos. A senha do usuário deve ser
cadastrada por ele no primeiro acesso. Uma carta de boas-vindas e o manual de regras da instituição devem
ser fornecidos para o usuário. São fornecidos como parâmetro para o script o tipo de usuário e o login do novo
usuário.

# Pré-requisitos do script novo_usuario_sh:
§ Criação dos grupos professores, tecnicos e alunos no sistema
§ Criação do arquivo regras.txt dentro de /home/

# Parâmetros, passados via linha de comando, do script novo_usuario.sh:
§ Tipo de usuário: [professor, tecnico, aluno]
§ Login: login do usuário no sistema. O login deve ser digitado em letras minúsculas e sem uso de
caracteres especiais ou acentuação (ex.: jsilva, marcos, csantos).

# Verificações realizadas pelo script antes da execução das ações:
§ Verificar se o login fornecido já existe no sistema
§ Verificar se o tipo de usuário informado pertence as opções disponíveis
§ Obs.: no caso de falha de qualquer umas das verificações, uma mensagem informativa deve
ser exibida ao usuário e a execução do script abortada.

# Ações e regras do script novo_usuario.sh
§ O diretório HOME do usuário será criado de acordo com seu tipo:
• professor -> /home/professores/<login>
• tecnico -> /home/tecnicos/<login>
• aluno -> /home/alunos/<login>
§ O usuário criado deve ser incluído no grupo correspondente
• professor -> grupo professores
• tecnico -> grupo tecnicos
• aluno -> grupos alunos
• Obs.: não se trata do grupo primário do usuário!
§ A senha do usuário deve ser excluída e expirada para que seja exigida sua modificação no próximo
acesso do usuário no sistema
§ Copiar o arquivo /home/regras.txt (que representa o manual de regras da instituição) para dentro do
diretório HOME do usuário
§ A carta de boas-vindas, contendo a data/hora da ativação do cadastro (data/hora de execução do script) e
o “cargo” do usuário, deve ser criada dentro do diretório HOME do usuário
• O nome do arquivo da carta deve seguir o padrão: welcome_<login>.txt (ex.:
welcome_jsilva.txt)
• A data/hora de ativação do cadastro deve seguir o padrão:
Þ <dia> de <mês> de <ano> às <hora>:<minutos>:<segundos>

Þ Ex.: 10 de Ago de 2022 às 10:32:22
• Exemplo de carta:
Olá jsilva, seja bem-vindo(a) à EMPRESA X.
Seu cargo na instituição é de: aluno
A ativação do seu cadastro foi realizada em: 10 de Ago de 2022 às 10:32:22
Bom trabalho!
