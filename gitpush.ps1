param (
    [string]$commitMessage #parametro para receber a mensagem de commit do usuário
)

git add * #adciona todos os arquivos para o commit
git commit -m "$commitMessage" #realiza o commit com a mensagem fornecida
git push MKP master #envia as alterações para o repositório remoto