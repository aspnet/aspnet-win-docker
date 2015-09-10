FROM windowsservercore

#Globally install DNVM in program data.
RUN @powershell -NoProfile -ExecutionPolicy unrestricted -Command "&{$Branch='dev';iex ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/glennc/aspnet-win-docker/master/globalinstall.ps1'))}"

#Add DNVM location to the path.
RUN setx C:\ProgramData\Microsoft DNX\bin

#Install DNVM globally on the machine and set it as persistent. This modifies the user path to have DNX on it.
#if the user trying to run DNX is not the same as the installing user then the path to the DNX will need to be specified.
RUN DNVM install 1.0.0-beta7 -global -persistent