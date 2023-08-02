$TARGET = "D:/cp"

foreach($FILE in $(git diff --name-only HEAD)){ 
  $DIR = Split-Path -Path $FILE 
  
  if(Test-Path -Path $TARGET/$DIR){
    Write-Host $TARGET/$DIR is already exists.
  } else {
    mkdir $TARGET/$DIR
  }

  cp $FILE $TARGET/$FILE
}
