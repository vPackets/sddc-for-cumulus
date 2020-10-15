# Check installed module
#Get-InstalledModule
#Find-Module -Name VMware.PowerCLI
#Get-Module VMware* -ListAvailable


# Certificate and connection to vCenter
Set-PowerCLIConfiguration -InvalidCertificateAction:Ignore -Confirm:$false
#Connect-VIServer srv-vcenter-01.megasp.net                

Connect-VIServer srv-vcenter-01.megasp.net -Protocol https -User Administrator@megasp.net -Password XXXXXX

# Variable assignement ATX-01 => $DC
#$DC = Get-Datacenter -Name ATX-01

$tor01 = Get-VM | ? {$_.name -match "^TOR-01"}
$tor02 = Get-VM | ? {$_.name -match "^TOR-02"}
$tor03 = Get-VM | ? {$_.name -match "^TOR-03"}
$tor04 = Get-VM | ? {$_.name -match "^TOR-04"}
$torspine = Get-VM | ? {$_.name -match "^TOR-S"}

$nic02tor01 = Get-VM $tor01 | Get-NetworkAdapter | ? {$_.name -match "^Network adapter 2"}
$nic03tor01 = Get-VM $tor01 | Get-NetworkAdapter | ? {$_.name -match "^Network adapter 3"}
$nic04tor01 = Get-VM $tor01 | Get-NetworkAdapter | ? {$_.name -match "^Network adapter 4"}

Set-NetworkAdapter -NetworkAdapter $nic02tor01 -Portgroup "DPG-TRUNK-TOR-01" -Confirm:$false
Set-NetworkAdapter -NetworkAdapter $nic03tor01 -Portgroup "DPG-TRUNK-TOR-02" -Confirm:$false
Set-NetworkAdapter -NetworkAdapter $nic04tor01 -Portgroup "DPG-TRUNK-TOR-01" -Confirm:$false

$nic02tor02 = Get-VM $tor02 | Get-NetworkAdapter | ? {$_.name -match "^Network adapter 2"}
$nic03tor02 = Get-VM $tor02 | Get-NetworkAdapter | ? {$_.name -match "^Network adapter 3"}
$nic04tor02 = Get-VM $tor02 | Get-NetworkAdapter | ? {$_.name -match "^Network adapter 4"}

Set-NetworkAdapter -NetworkAdapter $nic02tor02 -Portgroup "DPG-TRUNK-TOR-01" -Confirm:$false
Set-NetworkAdapter -NetworkAdapter $nic03tor02 -Portgroup "DPG-TRUNK-TOR-02" -Confirm:$false
Set-NetworkAdapter -NetworkAdapter $nic04tor02 -Portgroup "DPG-TRUNK-TOR-01" -Confirm:$false

$nic02tor03 = Get-VM $tor03 | Get-NetworkAdapter | ? {$_.name -match "^Network adapter 2"}
$nic03tor03 = Get-VM $tor03 | Get-NetworkAdapter | ? {$_.name -match "^Network adapter 3"}
$nic04tor03 = Get-VM $tor03 | Get-NetworkAdapter | ? {$_.name -match "^Network adapter 4"}

Set-NetworkAdapter -NetworkAdapter $nic02tor03 -Portgroup "DPG-TRUNK-TOR-01" -Confirm:$false
Set-NetworkAdapter -NetworkAdapter $nic03tor03 -Portgroup "DPG-TRUNK-TOR-02" -Confirm:$false
Set-NetworkAdapter -NetworkAdapter $nic04tor03 -Portgroup "DPG-TRUNK-TOR-01" -Confirm:$false

$nic02tor04 = Get-VM $tor04 | Get-NetworkAdapter | ? {$_.name -match "^Network adapter 2"}
$nic03tor04 = Get-VM $tor04 | Get-NetworkAdapter | ? {$_.name -match "^Network adapter 3"}
$nic04tor04 = Get-VM $tor04 | Get-NetworkAdapter | ? {$_.name -match "^Network adapter 4"}

Set-NetworkAdapter -NetworkAdapter $nic02tor04 -Portgroup "DPG-TRUNK-TOR-01" -Confirm:$false
Set-NetworkAdapter -NetworkAdapter $nic03tor04 -Portgroup "DPG-TRUNK-TOR-02" -Confirm:$false
Set-NetworkAdapter -NetworkAdapter $nic04tor04 -Portgroup "DPG-TRUNK-TOR-01" -Confirm:$false

$nic02torspine = Get-VM $torspine | Get-NetworkAdapter | ? {$_.name -match "^Network adapter 2"}
$nic03torspine = Get-VM $torspine | Get-NetworkAdapter | ? {$_.name -match "^Network adapter 3"}
$nic04torspine = Get-VM $torspine | Get-NetworkAdapter | ? {$_.name -match "^Network adapter 4"}

Set-NetworkAdapter -NetworkAdapter $nic02torspine -Portgroup "DPG-TRUNK-TOR-01" -Confirm:$false
Set-NetworkAdapter -NetworkAdapter $nic03torspine -Portgroup "DPG-TRUNK-TOR-02" -Confirm:$false
Set-NetworkAdapter -NetworkAdapter $nic04torspine -Portgroup "DPG-TRUNK-TOR-01" -Confirm:$false









