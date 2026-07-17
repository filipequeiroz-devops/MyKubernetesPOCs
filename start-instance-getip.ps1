$instanceId = "i-05f958d6e5717f930"

function start-instance {
    param (
        [string]$instanceId
    )

    aws ec2 start-instances --instance-ids $instanceId

    sleep 10 # Aguarda 10 segundos para garantir que a instância esteja em execução
}

function get-instance-public-ip {
    param (
        [string]$instanceId
    )

    $instanceInfo = aws ec2 describe-instances --instance-ids $instanceId --output json | ConvertFrom-Json
    $publicIp = $instanceInfo.Reservations[0].Instances[0].PublicIpAddress

    return Write-Output $publicIp
}

start-instance -instanceId $instanceId
get-instance-public-ip -instanceId $instanceId