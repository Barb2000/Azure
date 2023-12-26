# Cria um novo grupo de recursos chamado "Staging_VMs" localizado na região "Central US"
New-AzResourceGroup -Name "Staging_VMs" -Location "Central US"

# Obtém o identificador do grupo de recursos recém-criado, na variável rg
$rg = Get-AzResourceGroup -Name "Staging_VMs"

# Imprime o nome do grupo de recursos
$rg.ResourceGroupName

# Obtém a definição da política "0a914e76-4921-4c19-b460-a2d36003525a"
$definition = Get-AzPolicyDefinition -id "/providers/Microsoft.Authorization/policyDefinitions/0a914e76-4921-4c19-b460-a2d36003525a"

# Imprime a definição da política
Write-Host $definition

# Cria uma atribuição de política para o grupo de recursos recém-criado
New-AzPolicyAssignment -Scope $rg.ResourceId -PolicyDefinition $definition -Name "RgLocationMatch" -DisplayName "ResourceGroupMatches resources location"
