param (
    [string]$commitMessage #parametro para receber a mensagem de commit do usuário
)

git add * #adciona todos os arquivos para o commit
git commit -m "$commitMessage" #realiza o commit com a mensagem fornecida
git push MKP master #envia as alterações para o repositório remoto

start-sleep -Seconds 5 #aguarda 5 segundos para garantir que o push seja concluído antes de abrir o navegador

git status #exibe o status do repositório após o push