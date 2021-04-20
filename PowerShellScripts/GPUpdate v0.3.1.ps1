#-------------------------------------------------------------#
#----Initial Declarations-------------------------------------#
#-------------------------------------------------------------#

Add-Type -AssemblyName PresentationCore, PresentationFramework

$Xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" Width="412" Height="114" HorizontalAlignment="Left" VerticalAlignment="Top" Margin="0,0,0,0">
<Grid>
 
<TextBlock HorizontalAlignment="Left" VerticalAlignment="Top" TextWrapping="Wrap" Text="Target Computer Name:" Margin="5,45,0,0" Width="137" Height="25"/>
<TextBox HorizontalAlignment="Left" VerticalAlignment="Top" Height="23" Width="120" TextWrapping="Wrap" Margin="141,41,0,0" Name="TargetPCName" Text="{Binding targetPCName}"/>
<Button Content="GPUpdate" HorizontalAlignment="Left" VerticalAlignment="Top" Width="75" Margin="266,43,0,0" Name="GPUpdate"/>

</Grid>
</Window>
"@

#-------------------------------------------------------------#
#----Control Event Handlers-----------------------------------#
#-------------------------------------------------------------#


function GPUpdate {
    $Targets = $TargetPCName.Text
    \\mfhc-fs01\Share\IT\Useful_Tools\PSTools\psexec -accepteula "\\$Targets" -h gpupdate /force | Write-Host
}

function CheckEnter($sender, $e) {
    if ($e.Key -eq "Return") {
        GPUpdate
    }
}
#endregion

#-------------------------------------------------------------#
#----Script Execution-----------------------------------------#
#-------------------------------------------------------------#

$Window = [Windows.Markup.XamlReader]::Parse($Xaml)

[xml]$xml = $Xaml

$xml.SelectNodes("//*[@Name]") | ForEach-Object { Set-Variable -Name $_.Name -Value $Window.FindName($_.Name) }


$TargetPCName.Add_KeyUp( { CheckEnter $this $_ })
$GPUpdate.Add_Click( { GPUpdate $this $_ })

$State = [PSCustomObject]@{}


Function Set-Binding {
    Param($Target, $Property, $Index, $Name)
 
    $Binding = New-Object System.Windows.Data.Binding
    $Binding.Path = "[" + $Index + "]"
    $Binding.Mode = [System.Windows.Data.BindingMode]::TwoWay
    


    [void]$Target.SetBinding($Property, $Binding)
}

function FillDataContext($props) {

    For ($i = 0; $i -lt $props.Length; $i++) {
   
        $prop = $props[$i]
        $DataContext.Add($DataObject."$prop")
   
        $getter = [scriptblock]::Create("return `$DataContext['$i']")
        $setter = [scriptblock]::Create("param(`$val) return `$DataContext['$i']=`$val")
        $State | Add-Member -Name $prop -MemberType ScriptProperty -Value  $getter -SecondValue $setter
               
    }
}



$DataObject = ConvertFrom-Json @"

{
    "targetPCName" : "",
    "output" : ""
}

"@

$DataContext = New-Object System.Collections.ObjectModel.ObservableCollection[Object]
FillDataContext @("targetPCName", "output") 

$Window.DataContext = $DataContext
Set-Binding -Target $TargetPCName -Property $([System.Windows.Controls.TextBox]::TextProperty) -Index 0 -Name "targetPCName"
$Window.ShowDialog()


