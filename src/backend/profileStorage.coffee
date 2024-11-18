require '../stdlib'

if file_exists('../database/hd.yaml')
  files = load_yaml('../database/hd.yaml')
  print 'Usuário: '
  user = input()
  sizeTotal = 0
  filesCount=0
  print 'Arquivos de '+user+':'
  for file in files
    if file.usuario == user
      sizeTotal+=file.tamanho
      print file 
      filesCount++
  print 'Foram encontrados '+filesCount+' arquivos'
  print 'Espaço total ocupado por '+user+': '+sizeTotal+'MB' 
else
  print 'HD não detectado'