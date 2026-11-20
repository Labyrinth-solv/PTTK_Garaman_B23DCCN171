$env:JAVA_HOME = "C:\Program Files\Java\jdk-21.0.12.1"
$env:CATALINA_HOME = "D:\apache-tomcat-10.1.62\apache-tomcat-10.1.62"
$projectDir = $PSScriptRoot

$classesDir = Join-Path $projectDir "WebContent\WEB-INF\classes"
New-Item -ItemType Directory -Force -Path $classesDir | Out-Null

$javaFiles = Get-ChildItem -Path (Join-Path $projectDir "src") -Filter "*.java" -Recurse | ForEach-Object { $_.FullName }
& "$env:JAVA_HOME\bin\javac.exe" -encoding UTF-8 -d $classesDir $javaFiles
if ($LASTEXITCODE -ne 0) {
    Write-Error "Compile failed!"
    exit $LASTEXITCODE
}

Write-Host "Compile OK. Starting Tomcat at http://localhost:8080/garaman/"
& "$env:CATALINA_HOME\bin\catalina.bat" run
