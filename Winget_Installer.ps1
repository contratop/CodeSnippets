#head
Clear-Host

#check winget, if not exist, install
if (get-command winget -ErrorAction SilentlyContinue) {
    write-host "Winget is already installed" -ForegroundColor Green
}
else {
    write-warning "Winget not detected"
    write-host "Installing Winget..."
    start-sleep -s 2
    write-host "Detecting Architecture..."
    $script:architectureproc = (Get-WmiObject -Class Win86_ComputerSystem).SystemType
    #Dependencies ##############################################################
    write-host "Architecture detected: $architectureproc"
    if ($architectureproc -eq "x64-based PC") {
        if(-not(test-path -path "marcos64.Appx")){
            write-host "marcos64.Appx already exists"
            remove-item "marcos64.Appx"
            write-host "marcos64.Appx deleted" -ForegroundColor Cyan
        }
        write-host "Downloading marcos64 1/3"
        start-sleep -s 2
        Invoke-WebRequest -Uri "https://github.com/contratop/Sources/raw/main/far_data/marcos64.Appx" -OutFile "marcos64.Appx"
        if (-not($?)) {
            write-warning "Download failed"
            write-host "Check internet connection"
            exit
        }
        else {
            Add-AppPackage "marcos64.Appx"
            if ($?) {
                write-host "marcos64 installed" -ForegroundColor Green
            }
            else{
                write-warning "marcos64 installation failed"
                exit
            }
        }
        remove-item "marcos64.Appx"
        write-host "marcos64 cache deleted" -ForegroundColor Cyan



        if(-not(test-path -path "mui64.Appx")){
            write-host "mui64.Appx already exists"
            remove-item "mui64.Appx"
            write-host "mui64.Appx deleted" -ForegroundColor Cyan
        }
        write-host "Downloading mui64 2/3"
        start-sleep -s 2
        Invoke-WebRequest -Uri "https://github.com/contratop/Sources/raw/main/far_data/mui64.Appx" -OutFile "mui64.Appx"
        if (-not($?)) {
            write-warning "Download failed"
            write-host "Check internet connection"
            exit
        }
        else {
            Add-AppPackage "mui64.Appx"
            if ($?) {
                write-host "mui64 installed" -ForegroundColor Green
            }
            else{
                write-warning "mui64 installation failed"
                exit
            }
        }
        remove-item "mui64.Appx"
        write-host "mui64 cache deleted" -ForegroundColor Cyan
    }
    else{
        if(-not(test-path -path "marcos86.Appx")){
            write-host "marcos86.Appx already exists"
            remove-item "marcos86.Appx"
            write-host "marcos86.Appx deleted" -ForegroundColor Cyan
        }
        write-host "Downloading marcos86 1/3"
        start-sleep -s 2
        Invoke-WebRequest -Uri "https://github.com/contratop/Sources/raw/main/far_data/marcos86.Appx" -OutFile "marcos86.Appx"
        if (-not($?)) {
            write-warning "Download failed"
            write-host "Check internet connection"
            exit
        }
        else {
            Add-AppPackage "marcos86.Appx"
            if ($?) {
                write-host "marcos86 installed" -ForegroundColor Green
            }
            else{
                write-warning "marcos86 installation failed"
                exit
            }
        }
        remove-item "marcos86.Appx"
        write-host "marcos86 cache deleted" -ForegroundColor Cyan


        if(-not(test-path -path "mui86.Appx")){
            write-host "mui86.Appx already exists"
            remove-item "mui86.Appx"
            write-host "mui86.Appx deleted" -ForegroundColor Cyan
        }
        write-host "Downloading mui86 2/3"
        start-sleep -s 2
        Invoke-WebRequest -Uri "https://github.com/contratop/Sources/raw/main/far_data/mui86.appx" -OutFile "mui86.Appx"
        if (-not($?)) {
            write-warning "Download failed"
            write-host "Check internet connection"
            exit
        }
        else {
            Add-AppPackage "mui86.Appx"
            if ($?) {
                write-host "mui86 installed" -ForegroundColor Green
            }
            else{
                write-warning "mui86 installation failed"
                exit
            }
        }
        remove-item "mui86.Appx"
        write-host "mui86 cache deleted" -ForegroundColor Cyan
    }

    #Winget ####################################################################
    if(-not(test-path -path "winget.Appx")){
        write-host "winget.Appx already exists"
        remove-item "winget.Appx"
        write-host "winget.Appx deleted" -ForegroundColor Cyan
    }
    write-host "Downloading winget 3/3"
    start-sleep -s 2
    Invoke-WebRequest -Uri "https://github.com/contratop/Sources/raw/main/far_data/winget.Msixbundle" -OutFile "winget.Msixbundle"
    if (-not($?)) {
        write-warning "Download failed"
        write-host "Check internet connection"
        exit
    }
    else {
        Add-AppPackage "winget.Msixbundle"
        if ($?) {
            write-host "winget installed" -ForegroundColor Green
        }
        else{
            write-warning "winget installation failed"
            exit
        }
    }

}